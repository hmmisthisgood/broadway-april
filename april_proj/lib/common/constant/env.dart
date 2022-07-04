class Env {
  Env(this.baseUrl, this.imageUrl);
  final String baseUrl;
  final String imageUrl;
}

mixin EnvValue {
  static final Env development =
      Env('https://dev.example.com.np/api', 'https://example.com.np/api');

  static final Env staging =
      Env('https://staging.example.com.np/api', 'https://example.com.np/api');
  static final Env production =
      Env('https://prod.example.com.np/api', 'https://example.com.np/api');
}
