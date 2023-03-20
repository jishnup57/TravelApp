import 'package:carousel_slider/carousel_slider.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_card.dart';
import 'package:travel_aliga/app/modules/item/view/item_view.dart';
import 'package:travel_aliga/app/modules/map_search/controller/map_controller.dart';
import 'package:travel_aliga/app/utils/debounser/debounce.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class MapSearchView extends StatefulWidget {
  const MapSearchView({Key? key}) : super(key: key);

  @override
  State<MapSearchView> createState() => _MapSearchViewState();
}

class _MapSearchViewState extends State<MapSearchView> {
  final MapController controllerGetx = Get.put(MapController());
 /// final Completer<GoogleMapController> _controller = Completer();
 late final GoogleMapController _controllerGoogleMap ;
  int markerIdCounter = 1;
  final Set<Marker> _markers = <Marker>{};
  Position? position;
  final _debouncer = Debouncer(milliseconds: 2 * 1000);
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerGoogleMap.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: position == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    mapType: MapType.normal,
                    compassEnabled: true,
                    trafficEnabled: true,
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position!.latitude, position!.longitude),
                      zoom: 15,
                    ),
                    onTap: (tapped) async {
                      _setMarker(LatLng(tapped.latitude.toDouble(),
                          tapped.longitude.toDouble()));
                      controllerGetx.getPlaceDetails(tapped);
                    },
                    onMapCreated: (GoogleMapController controller) {
                     // _controller.complete(controller);
                     setState(() {  
                      _controllerGoogleMap = controller;
                     });
                    },
                  ),
          ),
          Obx(
            () => Visibility(
              visible: controllerGetx.searchVisible.value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: CupertinoSearchTextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }
                    getPlaces(value);
                  },
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          GetBuilder<MapController>(
            builder: (controllerGetx) => Visibility(
              visible: controllerGetx.itemList.isNotEmpty,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: false,
                      ),
                      items: controllerGetx.itemList
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: InkWell(
                                  onTap:(){
                                    Get.off(()=>ItemView(item: e));
                                  },
                                  child: CardFavorite(item: e,favorateVisible: false,)),
                              ))
                          .toList(),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          controllerGetx.itemListClear();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FabCircularMenu(
          alignment: Alignment.bottomLeft,
          fabColor: Colors.blue.shade50,
          fabOpenColor: Colors.red.shade100,
          ringDiameter: 250,
          ringWidth: 60.0,
          ringColor: Colors.blue.shade50,
          fabSize: 60,
          children: [
            IconButton(
              onPressed: () {
                controllerGetx.changeVisibilitySearch();
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                userPosition();
              },
              icon: Icon(Icons.gps_fixed),
            )
          ],
        ),
      ),
    );
  }

  void _setMarker(point) {
    var counter = markerIdCounter++;
    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);
    _markers.clear();
    setState(() {
      _markers.add(marker);
    });
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar('', 'Location Permission Denied');
    }
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    controllerGetx.currentPositionLatitude = currentPosition.latitude.toDouble();
    controllerGetx.currentPositionLongitude = currentPosition.longitude.toDouble();
    setState(() {
      position = currentPosition;
    });
  }

  gotoSearchPlace(double lat,double long) async {
    final GoogleMapController controller =  _controllerGoogleMap;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 15,
        ),
      ),
    );
  }
    getPlaces(String text) {
    _debouncer.run(() async {
      try {
        List<Location> locations = await locationFromAddress(text);
        final item = locations[0];
        gotoSearchPlace(item.latitude.toDouble(), item.longitude.toDouble());
        print(item.toJson());
      } catch (_) {
         ErrorDialoge.showSnakBar('Can not get location');
      }
    });
  }
  userPosition(){
     gotoSearchPlace(controllerGetx.currentPositionLatitude, controllerGetx.currentPositionLongitude);
     _setMarker(LatLng(controllerGetx.currentPositionLatitude, controllerGetx.currentPositionLongitude));
  }
}
