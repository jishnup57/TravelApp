

class PaymentErrorModel {
    PaymentErrorModel({
       required this.code,
       required this.description,
       required this.source,
       required this.step,
       required this.reason,
       required this.metadata,
    });

    String code;
    String description;
    String source;
    String step;
    String reason;
    Metadata metadata;


    factory PaymentErrorModel.fromJson(Map<String, dynamic> json) => PaymentErrorModel(
        code: json["code"],
        description: json["description"],
        source: json["source"],
        step: json["step"],
        reason: json["reason"],
        metadata: Metadata.fromJson(json["metadata"]),
    );

  
}

class Metadata {
    Metadata({
       required this.paymentId,
    });

    String paymentId;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        paymentId: json["payment_id"],
    );

   
}
