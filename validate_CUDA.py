import torch
import torchvision
from torchvision.models.resnet import ResNet18_Weights

print("VERIFICA SE O CUDA ESTA DISPONIVEL NO TORCH")
print("CUDA disponível:", torch.cuda.is_available())
print("Versão do CUDA:", torch.version.cuda)
print("Número de dispositivos CUDA:", torch.cuda.device_count())
print("Dispositivo CUDA atual:", torch.cuda.current_device())
print("Nome do dispositivo CUDA:", torch.cuda.get_device_name(0))
print("")

print("VERIFICA SE O CuDNN ESTA HABILITADO")
print("CuDNN disponível:", torch.backends.cudnn.is_available())
print("CuDNN habilitado:", torch.backends.cudnn.enabled)
print("Versão do CuDNN:", torch.backends.cudnn.version())
print("")

print("CONFIRMA SE O TORCHVISION USA O CUDA")
import torchvision.models as models

# Carregar um modelo pré-treinado (ex.: ResNet-18)
model = models.resnet18(weights=ResNet18_Weights.IMAGENET1K_V1)

# Mover o modelo para o dispositivo CUDA
if torch.cuda.is_available():
    model = model.to('cuda')
    print("Modelo movido para o CUDA")
else:
    print("CUDA não está disponível")

# Criar um tensor de entrada aleatório e mover para CUDA
input_tensor = torch.randn(1, 3, 224, 224)
if torch.cuda.is_available():
    input_tensor = input_tensor.to('cuda')

# Executar uma inferência
with torch.no_grad():
    output = model(input_tensor)
    print("Inferência concluída com sucesso!")
print("")

print("VERIFICA AS VERSOES DE TORCH E torchvision")
print("PyTorch versão:", torch.__version__)
print("torchvision versão:", torchvision.__version__)
