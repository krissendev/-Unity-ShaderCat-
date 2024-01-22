using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Bitoperation : MonoBehaviour
{
    int bSequence = 1+2+4+8+16+32+64;

    void Start()
    {
        Debug.Log(Convert.ToString(bSequence,2));    
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
