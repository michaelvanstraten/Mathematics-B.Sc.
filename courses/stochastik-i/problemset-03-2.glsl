const float EPS = 1e-4;

float sdSegment(vec2 p, vec2 a, vec2 b) {
    vec2 pa = p - a;
    vec2 ba = b - a;

    float h = clamp(dot(pa, ba) / max(dot(ba, ba), EPS), 0.0, 1.0);
    return length(pa - ba * h);
}

float triArea(vec2 a, vec2 b, vec2 c) {
    return 0.5 * abs((b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x));
}

float triangleMask(vec2 p, vec2 a, vec2 b, vec2 c) {
    vec2 v0 = c - a;
    vec2 v1 = b - a;
    vec2 v2 = p - a;

    float den = v0.x * v1.y - v1.x * v0.y;
    float u = (v2.x * v1.y - v1.x * v2.y) / den;
    float v = (v0.x * v2.y - v2.x * v0.y) / den;
    float w = 1.0 - u - v;

    return step(0.0, u) * step(0.0, v) * step(0.0, w);
}

vec2 toTriSpace(vec2 p, vec2 a, vec2 b, vec2 c) {
    return vec2(
        (p.x - b.x) / (c.x - b.x),
        (p.y - b.y) / (a.y - b.y)
    );
}

vec2 fromTriSpace(vec2 p, vec2 a, vec2 b, vec2 c) {
    return b + vec2(
        p.x * (c.x - b.x),
        p.y * (a.y - b.y)
    );
}

vec2 clampToTriangle(vec2 p) {
    p = max(p, vec2(EPS));

    float s = p.x + p.y;
    if (s > 1.0 - EPS) {
        p *= (1.0 - EPS) / s;
    }

    return p;
}

void getIntersections(vec2 p, out vec2 M, out vec2 L, out vec2 N) {
    M = p / max(p.x + p.y, EPS);
    L = vec2(p.x / max(1.0 - p.y, EPS), 0.0);
    N = vec2(0.0, p.y / max(1.0 - p.x, EPS));
}

vec3 drawLine(vec3 col, vec2 uv, vec2 a, vec2 b, vec3 lineCol, float width) {
    float d = sdSegment(uv, a, b);
    return mix(col, lineCol, smoothstep(width, 0.0, d));
}

vec3 drawPoint(vec3 col, vec2 uv, vec2 p, vec3 pointCol, float r) {
    float d = length(uv - p);
    float aa = fwidth(d);
    float a = 1.0 - smoothstep(r - aa, r + aa, d);
    return mix(col, pointCol, a);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    uv.x *= iResolution.x / iResolution.y;

    vec2 B = vec2(0.1, 0.1);
    vec2 C = vec2(0.9, 0.1);
    vec2 A = vec2(0.1, 0.9);

    vec3 col = vec3(0.96);

    vec2 p = toTriSpace(uv, A, B, C);

    vec2 M;
    vec2 L;
    vec2 N;
    getIntersections(p, M, L, N);

    float LMNArea = triArea(L, M, N);
    float BLNArea = triArea(vec2(0.0), L, N);
    float ANMArea = triArea(vec2(0.0, 1), N, M);
    float mask = triangleMask(uv, A, B, C);

    col = mix(col, vec3(0.0, 1.0, 0.0), 0.5 * step(BLNArea, LMNArea) * mask);
    col = mix(col, vec3(0.0, 0.0, 1.0), 0.5 * step(ANMArea, LMNArea) * mask);

    vec2 mouse = iMouse.xy / iResolution.xy;
    mouse.x *= iResolution.x / iResolution.y;

    vec2 defaultP = B + vec2(
        (C.x - B.x) / 3.0,
        (A.y - B.y) / 3.0
    );

    vec2 P = (iMouse.z > 0.0) ? mouse : defaultP;

    p = clampToTriangle(toTriSpace(P, A, B, C));
    P = fromTriSpace(p, A, B, C);

    getIntersections(p, M, L, N);

    vec2 hitA = fromTriSpace(L, A, B, C);
    vec2 hitB = fromTriSpace(M, A, B, C);
    vec2 hitC = fromTriSpace(N, A, B, C);

    vec3 black = vec3(0.0);
    vec3 blue = vec3(0.1, 0.25, 1.0);
    vec3 green = vec3(0.0, 0.6, 0.1);
    vec3 red = vec3(1.0, 0.05, 0.05);

    col = drawPoint(col, uv, P, red, 0.005);

    col = drawPoint(col, uv, A, black, 0.0075);
    col = drawPoint(col, uv, B, black, 0.0075);
    col = drawPoint(col, uv, C, black, 0.0075);

    col = drawLine(col, uv, A, B, black, 0.004);
    col = drawLine(col, uv, B, C, black, 0.004);
    col = drawLine(col, uv, C, A, black, 0.004);

    col = drawPoint(col, uv, hitA, green, 0.007);
    col = drawPoint(col, uv, hitB, green, 0.007);
    col = drawPoint(col, uv, hitC, green, 0.007);

    col = drawLine(col, uv, hitA, hitB, blue, 0.003);
    col = drawLine(col, uv, hitB, hitC, blue, 0.003);
    col = drawLine(col, uv, hitC, hitA, blue, 0.003);

    col = drawLine(col, uv, A, hitA, blue, 0.003);
    col = drawLine(col, uv, B, hitB, blue, 0.003);
    col = drawLine(col, uv, C, hitC, blue, 0.003);

    fragColor = vec4(col, 1.0);
}

