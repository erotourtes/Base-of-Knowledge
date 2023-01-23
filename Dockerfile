FROM klakegg/hugo:0.107.0-ubuntu-onbuild

# RUN addgroup app && adduser -S -G app app
# USER app

WORKDIR /app
COPY . . 

EXPOSE 1313

CMD ["server", "-D"]
