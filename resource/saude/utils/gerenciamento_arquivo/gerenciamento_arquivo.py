import zipfile
import os

def unzip_file(zip_file_path, dest_dir):
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)

    with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
        zip_ref.extractall(dest_dir)
        print(f"Extraindo arquivos para {dest_dir}")