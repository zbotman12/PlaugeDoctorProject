//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

float rand(vec2 p)
{
    return fract( cos( dot( p, vec2(5.237,6.378)))*8463.648);
}

float noise( vec2 p)
{
    float x1 = rand(vec2(floor(p.x),floor(p.y)));
    float x2 = rand(vec2(ceil(p.x),floor(p.y)));
    float top = mix(x1,x2,smoothstep(0.0,1.0,fract(p.x)));
    
    x1 = rand(vec2(floor(p.x),ceil(p.y)));
    x2 = rand(vec2(ceil(p.x),ceil(p.y)));
    float bottom = mix(x1,x2,smoothstep(0.0,1.0,fract(p.x)));
    
    return mix(top,bottom,smoothstep(0.0,1.0,fract(p.y)));
}


void main()
{
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    float n = (noise(v_vPosition/16.0)*0.2 +noise(v_vPosition/32.0)*0.2 
        +noise(v_vPosition/64.0)*0.3 +noise(v_vPosition/128.0)*0.3);
    vec3 lum = vec3(0.299, 0.587, 0.114);
    float bw= dot( Color.rgb, lum);//black and white result
    gl_FragColor = vec4( bw * vec3(1.0, 0.8, 0.4),n * Color.a/*clamp(n * Color.a, 0.01, 0.4)*/);
    //gl_FragColor = vec4(vec3(n),1.0);
}

