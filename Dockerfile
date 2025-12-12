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
RUN bun i -g @anthropic-ai/claude-code
RUN bun i -g @owloops/claude-powerline

RUN ln -s /root/.bun/bin/bun /usr/local/bin/node

# Set entrypoint
ENTRYPOINT ["tail", "-f", "/dev/null"]
