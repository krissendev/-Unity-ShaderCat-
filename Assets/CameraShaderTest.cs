using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

[ExecuteInEditMode]
    public class CameraShaderTest : MonoBehaviour
{
        public Shader ReplacementShader;

    //void OnValidate ()
    void OnEnable()
        {
            if (ReplacementShader != null)
            {
                GetComponent<Camera>().SetReplacementShader(ReplacementShader, "Opaque");
                Debug.Log("test1");
            }

        }
    
        void OnDisable()
        {
            GetComponent<Camera>().ResetReplacementShader();
            Debug.Log("test2");
        }
        
    }

