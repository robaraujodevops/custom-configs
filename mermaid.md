%% GCP Architecture for a simple Web App
graph LR
    %% The user outside of GCP
    user[👤 User]

    subgraph "Project: web-app-prod"
        %% Public facing services
        dns[Cloud DNS]
        lb(Cloud Load Balancer)

        %% Main VPC Network
        subgraph "VPC: default-vpc"
            direction LR
            subgraph "Region: us-central1"
                %% Web server tier
                mig[GCE Instance Group]

                %% Database tier
                db[(Cloud SQL - PostgreSQL)]
                
                %% Caching tier
                cache[Memorystore - Redis]
            end
        end
    end

    %% Define connections between all components
    user -- HTTPS --> dns
    dns --> lb
    lb --> mig
    mig <--> db
    mig <--> cache
