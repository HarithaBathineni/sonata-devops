# Step 1: Use a lightweight base Linux image
FROM alpine:latest

# Step 2: Run a command to print "Hello World" when the container starts
CMD ["echo", "Hello, World!"]
