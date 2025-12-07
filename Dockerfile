FROM node:20-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

# Install Claude Code
RUN bun i -g @anthropic-ai/claude-code

# Set entrypoint
ENTRYPOINT ["tail", "-f", "/dev/null"]
