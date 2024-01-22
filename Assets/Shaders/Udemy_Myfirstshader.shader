Shader "UdemyShaders/Udemy_Myfirstshader"
{
    Properties
    {
       _myColor("Example Colour", Color) = (1,1,1,1)
       _myEmission("Example Emission", Color) = (1,1,1,1)
	}

    SubShader
    {
        CGPROGRAM
		
			#pragma surface surf Lambert

			struct Input {float2 uvMainTex;};
			fixed4 _myColor;
			fixed4 _myEmission;

			void surf (Input IN, inout SurfaceOutput o)
			{
				o.Albedo = _myColor.rbg;
				o.Emission = _myEmission.rbg;
			}
			
        ENDCG
    }

    FallBack "Diffuse"
}

