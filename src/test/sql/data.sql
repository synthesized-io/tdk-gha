CREATE TABLE public.customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    account_balance numeric(15,2) NOT NULL
);

INSERT INTO public.customer(name, address, account_balance) VALUES ('Customer #1', '1 ABC', 25.0);
INSERT INTO public.customer(name, address, account_balance) VALUES ('Customer #2', '2 DEF', -421.3);
INSERT INTO public.customer(name, address, account_balance) VALUES ('Customer #3', '3 GHI', 676.15);