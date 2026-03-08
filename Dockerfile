FROM ubuntu:25.10

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip

# Install bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

# Install Claude Code
RUN bun i -g @anthropic-ai/claude-code @owloops/claude-powerline

# Create non-root user
RUN useradd -m -s /bin/bash claude
RUN cp -r /root/.bun /home/claude/.bun && chown -R claude:claude /home/claude/.bun
RUN ln -sf /home/claude/.bun/bin/bun /usr/local/bin/node

USER claude
ENV PATH="/home/claude/.bun/bin:$PATH"
WORKDIR /home/claude

# Set entrypoint
ENTRYPOINT ["tail", "-f", "/dev/null"]
