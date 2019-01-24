FROM ppodgorsek/robot-framework

RUN mkdir /test_directory

ENTRYPOINT ["robot"]