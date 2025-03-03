import pyzed.sl as sl
import cv2

def main():
    # Cria um objeto de câmera ZED
    zed = sl.Camera()

    init_params = sl.InitParameters()
    init_params.camera_resolution = sl.RESOLUTION.HD720
    init_params.camera_fps = 30

    status = zed.open(init_params)
    if status != sl.ERROR_CODE.SUCCESS:
        print(f"Falha ao abrir a câmera: {status}")
        exit(1)
    image = sl.Mat()

    while True:
        # Captura um frame da câmera
        if zed.grab() == sl.ERROR_CODE.SUCCESS:
            zed.retrieve_image(image, sl.VIEW.LEFT)
            image_ocv = image.get_data()
            cv2.imshow("ZED 2i Feed", image_ocv)
            key = cv2.waitKey(1)
            if key == ord('q'):
                break
    zed.close()

if __name__ == "__main__":
    main()
