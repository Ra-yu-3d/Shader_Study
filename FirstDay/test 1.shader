//階層とシェーダ名の定義
Shader "Custom/test 1"{
  SubShader{
    Tags { "RenderType"="Opaque" }
    LOD 200
    //CGPROGRAMとENDCG間に書かれたコードがCg語であることを定義している
    CGPROGRAM

    //ここはまだよく分かっとらん
    #pragma surface surf Standard fullforwardshadows
    #pragma target 3.0

    struct Input{
      //テクスチャのUV座標の取得
      float2 uv_MainTex;
    };

    fixed4 _BaseColor;
    void surf (Input IN, inout SurfaceOutputStandard o){
      //ShaderConで設定された色を出力
        o.Albedo = _BaseColor.rgb;
    }
    ENDCG
  }
    FallBack "Diffuse"
}
