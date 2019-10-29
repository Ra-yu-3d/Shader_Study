//リムライティングシェーダ―

Shader "Custom/Rim"
{
  SubShader{
    Tags {"RenderType" = "Opaque"}
    LOD 200

    CGPROGRAM
    #pragma surface surf Standard// alpha:fade
    #pragma target 3.0

    struct Input{
      float2 uv_MainTex;
      float3 worldNormal;
      float3 viewDir;
    };

    void surf(Input IN, inout SurfaceOutputStandard o){
      fixed4 baseColor = fixed4(0.05, 0.1, 0, 1);
      fixed4 rimColor = fixed4(0.5, 0.7, 0.5, 1);

      o.Albedo = baseColor;
      float rim = 1 - saturate(dot(IN.viewDir, o.Normal));
      //Emissionの値を大きくすることで輪郭線が光って見えるようになる
      o.Emission = rimColor*rim;//pow(rim, 2.5);
      //o.Alpha = rim*2;
    }
    ENDCG
  }
  FallBack "Diffuse"
}
