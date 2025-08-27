import 'package:equatable/equatable.dart';

class SourceEntity extends Equatable {
  final String? id;
  final String? name;
  final String? url;
  final String? country;
  const SourceEntity({this.id, this.name, this.url, this.country});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, url, country];
}
