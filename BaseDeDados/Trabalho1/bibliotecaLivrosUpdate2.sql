PGDMP  (                	    {           bibliotecaLivros    16.0    16.0 p    `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            c           1262    16501    bibliotecaLivros    DATABASE     �   CREATE DATABASE "bibliotecaLivros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Portugal.1252';
 "   DROP DATABASE "bibliotecaLivros";
                postgres    false            �            1259    17401    Compra    TABLE     �   CREATE TABLE public."Compra" (
    "compraID" integer NOT NULL,
    "utilizadorID" integer,
    "planoID" integer,
    preco double precision,
    cartao integer,
    "dataCompra" date
);
    DROP TABLE public."Compra";
       public         heap    postgres    false            �            1259    17400    Compra_compraID_seq    SEQUENCE     �   ALTER TABLE public."Compra" ALTER COLUMN "compraID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Compra_compraID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    17517    Nacionalidade    TABLE     h   CREATE TABLE public."Nacionalidade" (
    "nacionalidadeID" integer NOT NULL,
    nacionalidade text
);
 #   DROP TABLE public."Nacionalidade";
       public         heap    postgres    false            �            1259    17516 !   Nacionalidade_nacionalidadeID_seq    SEQUENCE     �   ALTER TABLE public."Nacionalidade" ALTER COLUMN "nacionalidadeID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Nacionalidade_nacionalidadeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    17407    Planos    TABLE     q   CREATE TABLE public."Planos" (
    "planosID" integer NOT NULL,
    preco double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public."Planos";
       public         heap    postgres    false            �            1259    17406    Planos_planosID_seq    SEQUENCE     �   ALTER TABLE public."Planos" ALTER COLUMN "planosID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Planos_planosID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    17414 
   atividades    TABLE     `   CREATE TABLE public.atividades (
    "atividadesID" integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.atividades;
       public         heap    postgres    false            �            1259    17413    atividades_atividadesID_seq    SEQUENCE     �   ALTER TABLE public.atividades ALTER COLUMN "atividadesID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."atividades_atividadesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    17422    autor    TABLE     �   CREATE TABLE public.autor (
    "autorID" integer NOT NULL,
    nome text NOT NULL,
    nacionalidade text NOT NULL,
    descricao text NOT NULL,
    fotografia text,
    morada text NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    17430 
   autorLivro    TABLE     x   CREATE TABLE public."autorLivro" (
    "autorLivroID" integer NOT NULL,
    "autorID" integer,
    "livroID" integer
);
     DROP TABLE public."autorLivro";
       public         heap    postgres    false            �            1259    17429    autorLivro_autorLivroID_seq    SEQUENCE     �   ALTER TABLE public."autorLivro" ALTER COLUMN "autorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autorLivro_autorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17421    autor_autorID_seq    SEQUENCE     �   ALTER TABLE public.autor ALTER COLUMN "autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autor_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17436 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    "categoriaID" integer NOT NULL,
    nome text NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    17435    categoria_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN "categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."categoria_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    17444 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    "comentarioID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    comentaio_data date NOT NULL,
    texto text NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    17443    comentario_comentarioID_seq    SEQUENCE     �   ALTER TABLE public.comentario ALTER COLUMN "comentarioID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."comentario_comentarioID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    17452    livro    TABLE     q  CREATE TABLE public.livro (
    "livroID" integer NOT NULL,
    titulo text NOT NULL,
    "imgCapa" text NOT NULL,
    descricao text NOT NULL,
    "faixaEtaria" integer NOT NULL,
    paginas integer NOT NULL,
    audio boolean NOT NULL,
    video boolean NOT NULL,
    tipo integer DEFAULT 1 NOT NULL,
    "paginaURL" text,
    "videoURL" text,
    "audioURL" text
);
    DROP TABLE public.livro;
       public         heap    postgres    false            �            1259    17461    livro_atividade    TABLE     �   CREATE TABLE public.livro_atividade (
    "livro_atividadeID" integer NOT NULL,
    "livroID" integer,
    "atividadeID" integer
);
 #   DROP TABLE public.livro_atividade;
       public         heap    postgres    false            �            1259    17460 %   livro_atividade_livro_atividadeID_seq    SEQUENCE     �   ALTER TABLE public.livro_atividade ALTER COLUMN "livro_atividadeID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_atividade_livro_atividadeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    17467    livro_categoria    TABLE     �   CREATE TABLE public.livro_categoria (
    "livro_categoriaID" integer NOT NULL,
    "livroID" integer,
    "categoriaID" integer
);
 #   DROP TABLE public.livro_categoria;
       public         heap    postgres    false            �            1259    17466 %   livro_categoria_livro_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.livro_categoria ALTER COLUMN "livro_categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_categoria_livro_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    17451    livro_livroID_seq    SEQUENCE     �   ALTER TABLE public.livro ALTER COLUMN "livroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_livroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    17473    log    TABLE     �  CREATE TABLE public.log (
    "logID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    "compraID" integer,
    log_data date,
    lido boolean,
    favorito boolean,
    percentagem integer,
    comentario_data date,
    comentario_texto text,
    compra_preco double precision,
    "compra_dataCompra" date,
    plano_preco double precision,
    "comentarioID" integer,
    "voucherID" integer,
    voucher_desconto integer
);
    DROP TABLE public.log;
       public         heap    postgres    false            �            1259    17472    log_logID_seq    SEQUENCE     �   ALTER TABLE public.log ALTER COLUMN "logID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."log_logID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    17525    nacionalidade_autor    TABLE     �   CREATE TABLE public.nacionalidade_autor (
    "nacionalidade_autorID" integer NOT NULL,
    "autorID" integer,
    "nacionalidadeID" integer
);
 '   DROP TABLE public.nacionalidade_autor;
       public         heap    postgres    false            �            1259    17524 -   nacionalidade_autor_nacionalidade_autorID_seq    SEQUENCE       ALTER TABLE public.nacionalidade_autor ALTER COLUMN "nacionalidade_autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."nacionalidade_autor_nacionalidade_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    17481    rating    TABLE     �   CREATE TABLE public.rating (
    "ratingID" integer NOT NULL,
    "livroID" integer,
    "utilizadorID" integer,
    valor integer NOT NULL
);
    DROP TABLE public.rating;
       public         heap    postgres    false            �            1259    17480    rating_ratingID_seq    SEQUENCE     �   ALTER TABLE public.rating ALTER COLUMN "ratingID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."rating_ratingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    17487 
   utilizador    TABLE     �   CREATE TABLE public.utilizador (
    "utilizadorID" integer NOT NULL,
    nome text NOT NULL,
    "ADM" boolean DEFAULT false NOT NULL,
    "nivelPlano" integer DEFAULT 0 NOT NULL,
    email text NOT NULL,
    pass text NOT NULL
);
    DROP TABLE public.utilizador;
       public         heap    postgres    false            �            1259    17497    utilizadorLivro    TABLE     �   CREATE TABLE public."utilizadorLivro" (
    "utilizadorLivroID" integer NOT NULL,
    utilizador integer,
    livro integer,
    lido boolean NOT NULL,
    favorito boolean DEFAULT false NOT NULL,
    percentagem integer DEFAULT 0 NOT NULL
);
 %   DROP TABLE public."utilizadorLivro";
       public         heap    postgres    false            �            1259    17496 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE     �   ALTER TABLE public."utilizadorLivro" ALTER COLUMN "utilizadorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizadorLivro_utilizadorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    17486    utilizador_utilizadorID_seq    SEQUENCE     �   ALTER TABLE public.utilizador ALTER COLUMN "utilizadorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_utilizadorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    17505    utilizador_voucher    TABLE     �   CREATE TABLE public.utilizador_voucher (
    "utilizador_voucherID" integer NOT NULL,
    "utilizadorID" integer,
    "voucherID" integer
);
 &   DROP TABLE public.utilizador_voucher;
       public         heap    postgres    false            �            1259    17504 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE       ALTER TABLE public.utilizador_voucher ALTER COLUMN "utilizador_voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_voucher_utilizador_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    17511    voucher    TABLE     X   CREATE TABLE public.voucher (
    "voucherID" integer NOT NULL,
    desconto integer
);
    DROP TABLE public.voucher;
       public         heap    postgres    false            �            1259    17510    voucher_voucherID_seq    SEQUENCE     �   ALTER TABLE public.voucher ALTER COLUMN "voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."voucher_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            ;          0    17401    Compra 
   TABLE DATA           f   COPY public."Compra" ("compraID", "utilizadorID", "planoID", preco, cartao, "dataCompra") FROM stdin;
    public          postgres    false    216   N�       [          0    17517    Nacionalidade 
   TABLE DATA           K   COPY public."Nacionalidade" ("nacionalidadeID", nacionalidade) FROM stdin;
    public          postgres    false    248   k�       =          0    17407    Planos 
   TABLE DATA           5   COPY public."Planos" ("planosID", preco) FROM stdin;
    public          postgres    false    218   ��       ?          0    17414 
   atividades 
   TABLE DATA           :   COPY public.atividades ("atividadesID", tipo) FROM stdin;
    public          postgres    false    220   ��       A          0    17422    autor 
   TABLE DATA           ^   COPY public.autor ("autorID", nome, nacionalidade, descricao, fotografia, morada) FROM stdin;
    public          postgres    false    222          C          0    17430 
   autorLivro 
   TABLE DATA           L   COPY public."autorLivro" ("autorLivroID", "autorID", "livroID") FROM stdin;
    public          postgres    false    224   ߋ       E          0    17436 	   categoria 
   TABLE DATA           8   COPY public.categoria ("categoriaID", nome) FROM stdin;
    public          postgres    false    226   ��       G          0    17444 
   comentario 
   TABLE DATA           f   COPY public.comentario ("comentarioID", "utilizadorID", "livroID", comentaio_data, texto) FROM stdin;
    public          postgres    false    228   �       I          0    17452    livro 
   TABLE DATA           �   COPY public.livro ("livroID", titulo, "imgCapa", descricao, "faixaEtaria", paginas, audio, video, tipo, "paginaURL", "videoURL", "audioURL") FROM stdin;
    public          postgres    false    230   6�       K          0    17461    livro_atividade 
   TABLE DATA           X   COPY public.livro_atividade ("livro_atividadeID", "livroID", "atividadeID") FROM stdin;
    public          postgres    false    232   S�       M          0    17467    livro_categoria 
   TABLE DATA           X   COPY public.livro_categoria ("livro_categoriaID", "livroID", "categoriaID") FROM stdin;
    public          postgres    false    234   p�       O          0    17473    log 
   TABLE DATA           �   COPY public.log ("logID", "utilizadorID", "livroID", "compraID", log_data, lido, favorito, percentagem, comentario_data, comentario_texto, compra_preco, "compra_dataCompra", plano_preco, "comentarioID", "voucherID", voucher_desconto) FROM stdin;
    public          postgres    false    236   ��       ]          0    17525    nacionalidade_autor 
   TABLE DATA           d   COPY public.nacionalidade_autor ("nacionalidade_autorID", "autorID", "nacionalidadeID") FROM stdin;
    public          postgres    false    250   ��       Q          0    17481    rating 
   TABLE DATA           N   COPY public.rating ("ratingID", "livroID", "utilizadorID", valor) FROM stdin;
    public          postgres    false    238   ǌ       S          0    17487 
   utilizador 
   TABLE DATA           \   COPY public.utilizador ("utilizadorID", nome, "ADM", "nivelPlano", email, pass) FROM stdin;
    public          postgres    false    240   �       U          0    17497    utilizadorLivro 
   TABLE DATA           p   COPY public."utilizadorLivro" ("utilizadorLivroID", utilizador, livro, lido, favorito, percentagem) FROM stdin;
    public          postgres    false    242   �       W          0    17505    utilizador_voucher 
   TABLE DATA           a   COPY public.utilizador_voucher ("utilizador_voucherID", "utilizadorID", "voucherID") FROM stdin;
    public          postgres    false    244   �       Y          0    17511    voucher 
   TABLE DATA           8   COPY public.voucher ("voucherID", desconto) FROM stdin;
    public          postgres    false    246   ;�       d           0    0    Compra_compraID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Compra_compraID_seq"', 1, false);
          public          postgres    false    215            e           0    0 !   Nacionalidade_nacionalidadeID_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."Nacionalidade_nacionalidadeID_seq"', 1, false);
          public          postgres    false    247            f           0    0    Planos_planosID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Planos_planosID_seq"', 1, false);
          public          postgres    false    217            g           0    0    atividades_atividadesID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."atividades_atividadesID_seq"', 1, false);
          public          postgres    false    219            h           0    0    autorLivro_autorLivroID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."autorLivro_autorLivroID_seq"', 1, false);
          public          postgres    false    223            i           0    0    autor_autorID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."autor_autorID_seq"', 1, false);
          public          postgres    false    221            j           0    0    categoria_categoriaID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."categoria_categoriaID_seq"', 1, false);
          public          postgres    false    225            k           0    0    comentario_comentarioID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."comentario_comentarioID_seq"', 1, false);
          public          postgres    false    227            l           0    0 %   livro_atividade_livro_atividadeID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."livro_atividade_livro_atividadeID_seq"', 1, false);
          public          postgres    false    231            m           0    0 %   livro_categoria_livro_categoriaID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."livro_categoria_livro_categoriaID_seq"', 1, false);
          public          postgres    false    233            n           0    0    livro_livroID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."livro_livroID_seq"', 1, false);
          public          postgres    false    229            o           0    0    log_logID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."log_logID_seq"', 1, false);
          public          postgres    false    235            p           0    0 -   nacionalidade_autor_nacionalidade_autorID_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public."nacionalidade_autor_nacionalidade_autorID_seq"', 1, false);
          public          postgres    false    249            q           0    0    rating_ratingID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."rating_ratingID_seq"', 1, false);
          public          postgres    false    237            r           0    0 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."utilizadorLivro_utilizadorLivroID_seq"', 1, false);
          public          postgres    false    241            s           0    0    utilizador_utilizadorID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."utilizador_utilizadorID_seq"', 1, false);
          public          postgres    false    239            t           0    0 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."utilizador_voucher_utilizador_voucherID_seq"', 1, false);
          public          postgres    false    243            u           0    0    voucher_voucherID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."voucher_voucherID_seq"', 1, false);
          public          postgres    false    245            v           2606    17405    Compra Compra_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY ("compraID");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Compra_pkey";
       public            postgres    false    216            �           2606    17523     Nacionalidade Nacionalidade_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Nacionalidade"
    ADD CONSTRAINT "Nacionalidade_pkey" PRIMARY KEY ("nacionalidadeID");
 N   ALTER TABLE ONLY public."Nacionalidade" DROP CONSTRAINT "Nacionalidade_pkey";
       public            postgres    false    248            x           2606    17412    Planos Planos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Planos"
    ADD CONSTRAINT "Planos_pkey" PRIMARY KEY ("planosID");
 @   ALTER TABLE ONLY public."Planos" DROP CONSTRAINT "Planos_pkey";
       public            postgres    false    218            z           2606    17420    atividades atividades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY ("atividadesID");
 D   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_pkey;
       public            postgres    false    220            ~           2606    17434    autorLivro autorLivro_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "autorLivro_pkey" PRIMARY KEY ("autorLivroID");
 H   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "autorLivro_pkey";
       public            postgres    false    224            |           2606    17428    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY ("autorID");
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    222            �           2606    17442    categoria categoria_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY ("categoriaID");
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    226            �           2606    17450    comentario comentario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY ("comentarioID");
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    228            �           2606    17465 $   livro_atividade livro_atividade_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_atividade_pkey PRIMARY KEY ("livro_atividadeID");
 N   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_atividade_pkey;
       public            postgres    false    232            �           2606    17471 $   livro_categoria livro_categoria_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria_pkey PRIMARY KEY ("livro_categoriaID");
 N   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria_pkey;
       public            postgres    false    234            �           2606    17459    livro livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY ("livroID");
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    230            �           2606    17479    log log_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY ("logID");
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    236            �           2606    17529 ,   nacionalidade_autor nacionalidade_autor_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT nacionalidade_autor_pkey PRIMARY KEY ("nacionalidade_autorID");
 V   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT nacionalidade_autor_pkey;
       public            postgres    false    250            �           2606    17485    rating rating_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY ("ratingID");
 <   ALTER TABLE ONLY public.rating DROP CONSTRAINT rating_pkey;
       public            postgres    false    238            �           2606    17503 $   utilizadorLivro utilizadorLivro_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "utilizadorLivro_pkey" PRIMARY KEY ("utilizadorLivroID");
 R   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "utilizadorLivro_pkey";
       public            postgres    false    242            �           2606    17495    utilizador utilizador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY ("utilizadorID");
 D   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT utilizador_pkey;
       public            postgres    false    240            �           2606    17509 *   utilizador_voucher utilizador_voucher_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher_pkey PRIMARY KEY ("utilizador_voucherID");
 T   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher_pkey;
       public            postgres    false    244            �           2606    17515    voucher voucher_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY ("voucherID");
 >   ALTER TABLE ONLY public.voucher DROP CONSTRAINT voucher_pkey;
       public            postgres    false    246            �           2606    17540    autorLivro Autores    FK CONSTRAINT     ~   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "Autores" FOREIGN KEY ("autorID") REFERENCES public.autor("autorID");
 @   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "Autores";
       public          postgres    false    4732    224    222            �           2606    17580    rating Livro    FK CONSTRAINT     v   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Livro" FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 8   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Livro";
       public          postgres    false    238    4740    230            �           2606    17590    utilizadorLivro Livro    FK CONSTRAINT     }   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Livro" FOREIGN KEY (livro) REFERENCES public.livro("livroID");
 C   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Livro";
       public          postgres    false    230    4740    242            �           2606    17585    rating Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Utilizador" FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 =   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Utilizador";
       public          postgres    false    4750    238    240            �           2606    17595    utilizadorLivro Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Utilizador" FOREIGN KEY (utilizador) REFERENCES public.utilizador("utilizadorID");
 H   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Utilizador";
       public          postgres    false    4750    242    240            �           2606    17560    livro_atividade atividade_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT atividade_livro FOREIGN KEY ("atividadeID") REFERENCES public.atividades("atividadesID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT atividade_livro;
       public          postgres    false    232    220    4730            �           2606    17610 '   nacionalidade_autor autor_nacionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT autor_nacionalidade FOREIGN KEY ("autorID") REFERENCES public.autor("autorID") NOT VALID;
 Q   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT autor_nacionalidade;
       public          postgres    false    4732    250    222            �           2606    17570    livro_categoria categoria_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT categoria_livro FOREIGN KEY ("categoriaID") REFERENCES public.categoria("categoriaID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT categoria_livro;
       public          postgres    false    226    4736    234            �           2606    17550    comentario livro    FK CONSTRAINT     x   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT livro FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 :   ALTER TABLE ONLY public.comentario DROP CONSTRAINT livro;
       public          postgres    false    228    230    4740            �           2606    17565    livro_atividade livro_ativiadde    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_ativiadde FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_ativiadde;
       public          postgres    false    232    230    4740            �           2606    17575    livro_categoria livro_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria;
       public          postgres    false    234    230    4740            �           2606    17545    autorLivro livros    FK CONSTRAINT     {   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT livros FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 =   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT livros;
       public          postgres    false    224    4740    230            �           2606    17615 '   nacionalidade_autor nacionalidade_autor    FK CONSTRAINT     �   ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT nacionalidade_autor FOREIGN KEY ("nacionalidadeID") REFERENCES public."Nacionalidade"("nacionalidadeID") NOT VALID;
 Q   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT nacionalidade_autor;
       public          postgres    false    4758    250    248            �           2606    17530    Compra plano_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT plano_utilizador FOREIGN KEY ("planoID") REFERENCES public."Planos"("planosID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT plano_utilizador;
       public          postgres    false    216    218    4728            �           2606    17555    comentario utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT utilizador FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 ?   ALTER TABLE ONLY public.comentario DROP CONSTRAINT utilizador;
       public          postgres    false    240    228    4750            �           2606    17535    Compra utilizador_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT utilizador_plano FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT utilizador_plano;
       public          postgres    false    4750    216    240            �           2606    17600 %   utilizador_voucher utilizador_voucher    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher;
       public          postgres    false    4750    244    240            �           2606    17605 %   utilizador_voucher voucher_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT voucher_utilizador FOREIGN KEY ("voucherID") REFERENCES public.voucher("voucherID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT voucher_utilizador;
       public          postgres    false    4756    244    246            ;      x������ � �      [      x������ � �      =      x������ � �      ?      x������ � �      A      x������ � �      C      x������ � �      E      x������ � �      G      x������ � �      I      x������ � �      K      x������ � �      M      x������ � �      O      x������ � �      ]      x������ � �      Q      x������ � �      S      x������ � �      U      x������ � �      W      x������ � �      Y      x������ � �     