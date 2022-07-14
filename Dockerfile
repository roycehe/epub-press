FROM node:12

EXPOSE 3000
WORKDIR /usr/src/epub-press
RUN ls /etc/apt/
COPY package.json package-lock.json ./
RUN cat /etc/apt/sources.list
RUN rm -rf /etc/apt/sources.list
RUN touch /etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install --production

# Automatically downloads and installs Calibre. To use Kindlegen instead, set ARG converter=kindlegen.
ARG converter=calibre
ENV CONVERSION_BACKEND=$converter
RUN if [ "$converter" = "calibre" ] ; then apt-get update && apt-get install -y libgl1-mesa-glx && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin install_dir=calibre-bin/ isolated=y ; fi


COPY . .

CMD ["npm", "run", "start:docker"]
