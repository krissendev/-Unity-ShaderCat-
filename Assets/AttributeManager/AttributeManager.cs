using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class AttributeManager : MonoBehaviour
{
    public Text attributeDisplay;
    static public int s_magic = 16;
    static public int s_charisma = 8;

    [SerializeField] private Vector3 someValue = new Vector3 (0,-100,0);
    int attributes = 0;

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "MAGIC")
        {
            attributes |= s_magic;
        }
        else if (other.gameObject.tag == "CHARISMA")
        {
            attributes |= s_charisma;
        }
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 screenPoint = Camera.main.WorldToScreenPoint(this.transform.position);
        attributeDisplay.transform.position = screenPoint + (someValue);
        attributeDisplay.text = Convert.ToString(attributes, 2).PadLeft(8, '0');
    }
       
}
