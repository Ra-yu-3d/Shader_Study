//テクスチャを描写するシェーダ―

Shader "Custom/TextureDisplay"{
  Properties{
    //インスペクターからテクスチャを設定できるようにしている
    _MainTex("Texture", 2D) = "white"{}
  }

  SubShader{
    Tags {"RenderType" = "Opaque"}
    LOD 200

    CGPROGRAM
    #pragma surface surf Standard fullforwardshadows
    #pragma target 3.0

    //InputにUVの変数を宣言することによりテクスチャのUV座標が自動的に渡される
    struct Input{
      float2 uv_MainTex;
    };

    //テクスチャ格納用の変数
    sampler2D _MainTex;

    //_MainTexからuv_MainTexで指定された座標の色を取得して出力している
    void surf(Input IN, inout SurfaceOutputStandard o){
      o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
    }
    ENDCG
  }
  FallBack "Diffuse"
}
