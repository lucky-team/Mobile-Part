class Claim {
  final String policyid;
  final String aloca;
  final DateTime adate, cdate, udate;
  final double amt;
  final List lof;

  Claim(this.policyid, this.aloca, this.adate, this.amt, this.lof, this.cdate,
      this.udate);

  Claim.fromJson(Map<Object, dynamic> json)
      : policyid = json['_id'],
        aloca = json['accLocation'],
        adate = json['accDate'],
        amt = json['claimAmount'],
        lof = json['claimFiles'],
        cdate = json['createdAt'],
        udate = json['updatedAt'];

  Map<String, dynamic> toJson() =>
      {
        '_ide': policyid,
        'accLocation': aloca,
        'accDate': adate,
        'claimAmount': amt,
        'claimFiles': lof,
        'status': 'in processing',
      };
}