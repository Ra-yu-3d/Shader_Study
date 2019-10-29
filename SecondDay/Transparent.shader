//オブジェクトを半透明にするシェーダー

Shader "Custom/Transparent"
{
    SubShader
    {
        //描写の優先度を変更して不透明オブジェクトを先に描写してから半透明オブジェクトが描写されるようにする
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        //alpha:fadeを記述することで半透明でしてるらしい
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = fixed4(0.6f, 0.7f, 0.4f, 1);
            //透明度の値の設定
            o.Alpha = 0.6;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
