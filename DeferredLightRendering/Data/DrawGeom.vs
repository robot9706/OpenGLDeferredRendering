﻿#version 330                                                                        
in vec3 Position;                                                                                       
in vec2 Tex;   
in vec3 Norm;  

uniform mat4 View;     
uniform mat4 Proj;     
uniform mat4 World;      

out vec2 TexCoord;                                                                 
out vec3 Nrm;                                                                   
out vec3 WorldPos;

void main()
{       
	mat3 worldRotationInverse = transpose(mat3(World));

	TexCoord      = Tex;                  
    Nrm        = (worldRotationInverse * Norm);   
    WorldPos      = (World * vec4(Position, 1.0)).xyz;

    gl_Position  = Proj * View * World * vec4(Position, 1.0);
}