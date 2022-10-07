#coding:utf-8
import cv2
import os
import piexif

raw_images_folder = './raw_images/'

save_images_folder = './save_image/' 

name_list_path = './name_list.txt'

wrong_folder = './wrong/'


def get_image(image_name,raw_images_folder,save_images_folder ):
    print(image_name)
    if image_name == '.DS_Store':
        return 0
    image_path = os.path.join( raw_images_folder,'%s.jpg'%(image_name))
    
    save_file_path = os.path.join(save_images_folder,'%s.jpg'%(image_name))
    image = cv2.imread(image_path)
    cv2.imwrite(save_file_path,image)
    piexif.remove(save_file_path)

def make_name_list(wrong_folder, name_list_path):

    image_file_list = os.listdir(wrong_folder)

    text_image_name_list_file=open(name_list_path,'w') 

    for  image_file_name in image_file_list:
        image_name,file_extend = os.path.splitext(image_file_name)
        text_image_name_list_file.write(image_name+'\n')
    
    text_image_name_list_file.close()


if __name__ == '__main__': 

    make_name_list(wrong_folder, name_list_path)

    image_names = open(name_list_path).read().strip().split()

    image_total = 0
    for image_name in image_names:
        box_num = get_image(image_name,raw_images_folder,save_images_folder)
        image_total += 1
        print('Image number:',image_total)
