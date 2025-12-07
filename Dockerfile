FROM ubuntu:25.10

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

# Install Claude Code
RUN bun i -g @anthropic-ai/claude-code

RUN ln -s /root/.bun/bin/bun /usr/local/bin/node

# Set entrypoint
ENTRYPOINT ["tail", "-f", "/dev/null"]
