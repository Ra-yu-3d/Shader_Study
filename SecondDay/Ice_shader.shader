//氷風シェーダ―

Shader "Custom/Ice_shader"{
  SubShader{
    Tags{"Queue" = "Transparent"}
    LOD 200

    CGPROGRAM
    #pragma surface surf Standard alpha:fade
    #pragma target 3.0

    struct Input{
      //オブジェクト(ポリゴンごと)の法線ベクトル
      float3 worldNormal;
      //カメラの視線ベクトル
      float3 viewDir;
    };

    void surf(Input IN, inout SurfaceOutputStandard o){
      o.Albedo = fixed4(1, 1, 1, 1);
      float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
      //定数の値を大きくすると輪郭線が濃くなり、0に近づけると輪郭線が薄くなる。
      o.Alpha = alpha*0.5f;
    }
    ENDCG
  }
  FallBack "Diffuse"
}

/*21行目でポリゴンの法線ベクトルと視点ベクトルの内積を算出している。
これによりオブジェクトの輪郭部分とそうでない部分区別をつけている。*/
