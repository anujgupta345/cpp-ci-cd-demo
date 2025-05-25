FROM gcc:latest
WORKDIR /app
COPY main.cpp .
RUN g++ -o hello main.cpp
CMD ["./hello"]
