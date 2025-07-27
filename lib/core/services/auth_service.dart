// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';


// import 'package:youtube/core/api/api_consumer.dart';
// import 'package:youtube/core/api/end_ponits.dart';
// import 'package:youtube/core/cache/cache_helper.dart';

// class AuthService {
//   final ApiConsumer api;
//   final CacheHelper cache;

//   AuthService({
//     required this.api,
//     required this.cache,
//   });

//   Future<bool> signIn(String email, String password) async {
//     final response = await api.post(
//       EndPoint.signIn,
//       data: {
//         ApiKey.email: email,
//         ApiKey.password: password,
//       },
//     );
//     if (response[ApiKey.status] == 200) {
//       await cache.saveData(key: ApiKey.token, value: response[ApiKey.token]);
//       return true;
//     }
//     return false;
//   }

//   Future<bool> signUp(String email, String password, String name) async {
//     final response = await api.post(
//       EndPoint.signUp,
//       data: {
//         ApiKey.email: email,
//         ApiKey.password: password,
//         ApiKey.name: name,
//       },
//     );
//     if (response[ApiKey.status] == 201) {
//       await cache.saveData(key: ApiKey.token, value: response[ApiKey.token]);
//       return true;
//     }
//     return false;
//   }

//   Future<void> signOut() async {
//     await cache.removeData(key: ApiKey.token);
//   }

//   String? getToken() => cache.getDataString(key: ApiKey.token);

//   AuthService copyWith({
//     ApiConsumer? api,
//     CacheHelper? cache,
//   }) {
//     return AuthService(
//       api: api ?? this.api,
//       cache: cache ?? this.cache,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       // 'api': api.toMap(),
//       // 'cache': cache.toMap(),
//     };
//   }

//   factory AuthService.fromMap(Map<String, dynamic> map) {
//     return AuthService(
//       // api: ApiConsumer.fromMap(map['api'] as Map<String,dynamic>),
//       // cache: CacheHelper.fromMap(map['cache'] as Map<String,dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AuthService.fromJson(String source) => AuthService.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'AuthService(api: $api, cache: $cache)';

//   @override
//   bool operator ==(covariant AuthService other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.api == api &&
//       other.cache == cache;
//   }

//   @override
//   int get hashCode => api.hashCode ^ cache.hashCode;
// }
