using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//test1で出力する色を設定する
public class ShaderCon : MonoBehaviour
{
    void Start(){
      GetComponent<Renderer> ().material.SetColor ("_BaseColor", Color.red);
    }
}
