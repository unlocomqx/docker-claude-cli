# Claude Code Docker Setup

## Usage

1. Create `.env` file with your API key:
```bash
cp .env.example .env
# Edit .env and add your ANTHROPIC_API_KEY
```

2. Create workspace directory:
```bash
mkdir -p workspace
```

3. Run:
```bash
docker-compose run --rm claude
```

## Security Options

Uncomment in `docker-compose.yml` for stricter isolation:
- `read_only: true` - Read-only filesystem
- `tmpfs: /tmp` - Writable temp directory
- `no-new-privileges` - Prevent privilege escalation
