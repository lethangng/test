// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeThi {
  final int idDeThi;
  final int uId;
  final String time;
  final int cauHienTai;

  DeThi({
    required this.idDeThi,
    required this.uId,
    required this.time,
    required this.cauHienTai,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDeThi': idDeThi,
      'uId': uId,
      'time': time,
      'cauHienTai': cauHienTai,
    };
  }

  factory DeThi.fromMap(Map<String, dynamic> map) {
    return DeThi(
      idDeThi: map['idDeThi'] as int,
      uId: map['uId'] as int,
      time: map['time'] as String,
      cauHienTai: map['cauHienTai'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeThi.fromJson(String source) =>
      DeThi.fromMap(json.decode(source) as Map<String, dynamic>);

  DeThi copyWith({
    int? idDeThi,
    int? uId,
    String? time,
    int? cauHienTai,
  }) {
    return DeThi(
      idDeThi: idDeThi ?? this.idDeThi,
      uId: uId ?? this.uId,
      time: time ?? this.time,
      cauHienTai: cauHienTai ?? this.cauHienTai,
    );
  }

  @override
  String toString() {
    return 'DeThi(idDeThi: $idDeThi, uId: $uId, time: $time, cauHienTai: $cauHienTai)';
  }

  @override
  bool operator ==(covariant DeThi other) {
    if (identical(this, other)) return true;

    return other.idDeThi == idDeThi &&
        other.uId == uId &&
        other.time == time &&
        other.cauHienTai == cauHienTai;
  }

  @override
  int get hashCode {
    return idDeThi.hashCode ^
        uId.hashCode ^
        time.hashCode ^
        cauHienTai.hashCode;
  }
}
