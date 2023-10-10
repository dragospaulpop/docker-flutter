FROM dart

RUN apt-get update
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa

RUN apt-get clean

RUN mkdir -p /root/code

RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
ENV PATH="/flutter/bin:$PATH"
RUN flutter doctor

# Add the alias for starting the Flutter web development server
RUN echo 'alias start-dev-web="flutter clean && flutter run -d web-server --web-hostname 0.0.0.0 --web-port 3000"' >> ~/.bashrc