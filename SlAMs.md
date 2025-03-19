# SLAMs
## 1. pySLAM-D
Foco: Algoritmo de SLAM em tempo real para UAVs (drones) com costura de imagens aéreas.
Características:
Geração de gráficos de fatores com nós representando poses de câmeras georreferenciadas.
Utiliza fatores de odometria, GPS e atitude para otimização espacial.
Projetado para ser robusto a ruídos de sensores e melhorar a consistência espacial1.
Dependências: GTSAM, TEASER++, entre outras.
Uso: Principalmente para aplicações de drones, onde a precisão da georreferência é crucial.
## 2. PySlam
Foco: Implementação de SLAM em Python, influenciada pelo ORB SLAM 1 e 2.
Características:
Utiliza Python3, Pangolin e OpenCV.
Design inspirado em ORB SLAM, conhecido por sua eficiência em visual SLAM.
Dependências: Pangolin, OpenCV.
Uso: Projetado para ser uma implementação simples e eficiente de SLAM, adequada para pesquisa e desenvolvimento.
## 3. pySLAM
* Foco: Pipeline de SLAM visual em Python para câmeras monoculares, estéreo e RGBD.
* Características:
Suporta uma ampla gama de características locais e globais modernas.
Métodos de fechamento de loop, pipeline de reconstrução volumétrica e modelos de predição de profundidade.
Integração com bibliotecas como Open3D e Kornia2.
Dependências: Open3D, Kornia, entre outras.
* Uso: Versátil e abrangente, adequado para várias aplicações de SLAM, desde pesquisa até aplicações práticas.

## Comparação Geral

pySLAM-D é especializado para uso em drones, focando na precisão da georreferência e na robustez contra ruídos de sensores.
PySlam é uma implementação mais simples e direta, inspirada em ORB SLAM, adequada para quem busca uma solução eficiente e fácil de usar.
pySLAM de Luigi Freda é mais abrangente, suportando múltiplos tipos de câmeras e oferecendo uma ampla gama de funcionalidades, tornando-o adequado para uma variedade de aplicações de SLAM.
Se precisar de mais detalhes sobre algum desses projetos ou tiver outras perguntas, estou aqui para ajudar!
