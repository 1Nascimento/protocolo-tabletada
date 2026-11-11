# Prompts de geração

Ferramenta: image_gen nativa da OpenAI. Referência visual: Planta Pixelada do Laboratório de Robótica.png, fornecida pelo usuário. Cada elemento foi solicitado em uma chamada separada.

## Objetos
Prefixo comum: Use case: stylized-concept. Asset type: single game sprite PNG. Input image: robotics laboratory provided as STYLE REFERENCE. Create [SUBJECT]. Match the reference pixel art: dark navy blue steel, desaturated teal, bright cyan accents, crisp chunky pixel clusters, top-down slightly visible front face. Exactly ONE isolated object centered with generous transparent padding. No floor, no scene, no other objects, no words, no checkerboard. Transparent background.

SUBJECT por arquivo:
- mesa: one horizontal robotics workbench like the four rectangular tables, cyan light on upper edge, small turquoise display on left and round status lamp on right, yellow warning corners, no text
- servidor: one upright central server cabinet with three dark horizontal drawers, cyan indicator LEDs and yellow corner guards
- terminal: one small freestanding control terminal with cyan screen showing a robot arm icon and tiny buttons
- planta: one green leafy plant in a brown pot inside a square dark steel planter
- caixa: one small dark blue steel storage crate with an X braced lid
- kit_medico: one compact upright medical case with carrying handle and a white panel with green medical cross

## Ambiente
Prefixo comum: Use case: stylized-concept. Single game sprite, [SUBJECT]. Reference image is STYLE REFERENCE: match its crisp pixel art, dark navy steel and cyan accent palette. One element only, no text, no additional objects.
Sufixo para parede, esteira e marcador: Isolate centered on genuine transparent background with padding.
Sufixo para piso: Seamless tile texture, no transparency.

SUBJECT por arquivo:
- piso: a single square seamless floor tile, dark navy laboratory metal floor, thin teal grid seams; opaque square filling image, no objects
- parede: one horizontal modular steel laboratory wall segment, yellow and black hazard stripe across top, cyan light centered, top-down game view
- esteira: one straight horizontal narrow dark steel grated conveyor or cable duct segment, repeated metal bars, top-down view
- marcador: one circular cyan floor holographic marker, thin cyan outline circle with a tiny solid square in its center, top-down view

O piso é uma textura candidata a repetição: a continuidade das bordas ainda precisa de avaliação no jogo. PNGs mantidos na resolução e transparência originais da ferramenta, sem recorte automático.
