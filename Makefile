up:
	docker compose -f dc.unleash.yaml -f dc.backstage.yaml -f dc.backend.yaml up -d

down:
	docker compose -f dc.unleash.yaml -f dc.backstage.yaml down

backstage:
	cd backstage && yarn build:backend && docker compose -f dc.backstage.yaml up -d
