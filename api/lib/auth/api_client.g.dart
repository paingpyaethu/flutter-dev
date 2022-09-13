// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.1.2:8000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Message> register(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Message>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'create-user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Message.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Message> login(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Message>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Message.fromJson(_result.data!);
    return value;
  }

  @override
  Stream<List<Post>> getAllPosts(authApi) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Post>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'posts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Post.fromJson(i as Map<String, dynamic>))
        .toList();
    yield value;
  }

  @override
  Future<Message> createPost(authApi, post) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(post.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Message>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'create-post',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Message.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Post> getPostById(authApi, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Post>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'post/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Post.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Message> updatePostById(authApi, post, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(post.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Message>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'posts/edit/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Message.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Message> deletePostById(authApi, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Message>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'posts/delete/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Message.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
