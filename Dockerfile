FROM nvcr.io/nvidia/pytorch:22.12-py3

# Set environment variables
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV PYTHONIOENCODING=UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Configure pip to use Kakao mirror (faster in Korea)
RUN printf "%s\n"\
    "[global]"\
    "index-url=https://mirror.kakao.com/pypi/simple/"\
    "extra-index-url=https://pypi.org/simple/"\
    "trusted-host=mirror.kakao.com"\
    > /etc/pip.conf

# Install system packages
RUN apt update -qq && apt install -qqy\
        sudo\
        tzdata\
        vim\
        curl\
        jq\
        git\
        libgl1-mesa-glx\
        libglib2.0-0\
    && apt clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip + install all Python packages in one layer
RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir \
    accelerate==0.27.2\
    click\
    ipywidgets\
    jupyter\
    jupyter_contrib_nbextensions\
    jupyterlab==4.2.3\
    matplotlib\
    natsort\
    numpy==1.24.4\
    nibabel\
    monai\
    opencv-contrib-python-headless\
    openpyxl\
    pandas\
    Pillow\
    psutil\
    pylibjpeg\
    pylibjpeg-libjpeg\
    pylibjpeg-openjpeg\
    pydicom\
    requests\
    scipy\
    scikit-image\
    scikit-learn\
    tqdm \
    init==0.1.0 \
    packaging==24.1 \
    option==2.1.0 \
    lpips==0.1.4 \
    sklearn==0.0.post12 \
    joblib==1.4.2 \
    matplotlib==3.9.0 \
    tqdm==4.66.4 \
    ptflops==0.7.3 \
    scipy==1.14.0 \
    optimizers==0.1 \
    loader==2017.9.11 \
    natsort==8.4.0 \
    monai==1.3.2 \
    pydicom==2.4.4 \
    torch==2.3.1 \
    einops==0.8.0 \
    h5py==3.11.0 \
    typing==3.10.0.0 \
    skimage==0.0 \
    datasets==2.20.0 \
    kornia==0.7.3 \
    solver==0.0.4 \
    torchvision==0.18.1 \
    dataloaders==0.0.1 \
    lr_scheduler==0.1 \
    gudhi
