PGDMP  -    
            
    {         
   biblioteca    16.0    16.0 t    h           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            i           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            j           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            k           1262    32768 
   biblioteca    DATABASE     �   CREATE DATABASE biblioteca WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Portugal.1252';
    DROP DATABASE biblioteca;
                postgres    false            �           1247    32993 	   gen_check    DOMAIN     x   CREATE DOMAIN public.gen_check AS text
	CONSTRAINT gen_check_check CHECK ((VALUE = ANY (ARRAY['M'::text, 'F'::text])));
    DROP DOMAIN public.gen_check;
       public          postgres    false            �            1255    33002    valid_comen_date()    FUNCTION     s  CREATE FUNCTION public.valid_comen_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
if new.comentario_data <= CURRENT_TIMESTAMP then
insert into comentario(utilizadorID, livroID,comentario_data,texto)
values(new.utilizadorID, new.livroID, new.comentario_data,new.texto);
else
RAISE EXCEPTION 'Impossivel. Data superor à atual!';
end if;
return null;
end;
$$;
 )   DROP FUNCTION public.valid_comen_date();
       public          postgres    false            �            1259    32769    Compra    TABLE     �   CREATE TABLE public."Compra" (
    "compraID" integer NOT NULL,
    "utilizadorID" integer,
    "planoID" integer,
    preco double precision,
    cartao integer,
    "dataCompra" date
);
    DROP TABLE public."Compra";
       public         heap    postgres    false            �            1259    32772    Compra_compraID_seq    SEQUENCE     �   ALTER TABLE public."Compra" ALTER COLUMN "compraID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Compra_compraID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    32773    Nacionalidade    TABLE     h   CREATE TABLE public."Nacionalidade" (
    "nacionalidadeID" integer NOT NULL,
    nacionalidade text
);
 #   DROP TABLE public."Nacionalidade";
       public         heap    postgres    false            �            1259    32778 !   Nacionalidade_nacionalidadeID_seq    SEQUENCE     �   ALTER TABLE public."Nacionalidade" ALTER COLUMN "nacionalidadeID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Nacionalidade_nacionalidadeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    32779    Planos    TABLE     q   CREATE TABLE public."Planos" (
    "planosID" integer NOT NULL,
    preco double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public."Planos";
       public         heap    postgres    false            �            1259    32783    Planos_planosID_seq    SEQUENCE     �   ALTER TABLE public."Planos" ALTER COLUMN "planosID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Planos_planosID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    32784 
   atividades    TABLE     `   CREATE TABLE public.atividades (
    "atividadesID" integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.atividades;
       public         heap    postgres    false            �            1259    32789    atividades_atividadesID_seq    SEQUENCE     �   ALTER TABLE public.atividades ALTER COLUMN "atividadesID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."atividades_atividadesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    32790    autor    TABLE     �   CREATE TABLE public.autor (
    "autorID" integer NOT NULL,
    nome text NOT NULL,
    descricao text NOT NULL,
    fotografia text,
    morada text NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    32795 
   autorLivro    TABLE     x   CREATE TABLE public."autorLivro" (
    "autorLivroID" integer NOT NULL,
    "autorID" integer,
    "livroID" integer
);
     DROP TABLE public."autorLivro";
       public         heap    postgres    false            �            1259    32798    autorLivro_autorLivroID_seq    SEQUENCE     �   ALTER TABLE public."autorLivro" ALTER COLUMN "autorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autorLivro_autorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    32799    autor_autorID_seq    SEQUENCE     �   ALTER TABLE public.autor ALTER COLUMN "autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autor_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    32800 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    "categoriaID" integer NOT NULL,
    nome text NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    32805    categoria_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN "categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."categoria_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    32806 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    "comentarioID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    comentario_data date NOT NULL,
    texto text NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    32811    comentario_comentarioID_seq    SEQUENCE     �   ALTER TABLE public.comentario ALTER COLUMN "comentarioID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."comentario_comentarioID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    32812    livro    TABLE     q  CREATE TABLE public.livro (
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
       public         heap    postgres    false            �            1259    32818    livro_atividade    TABLE     �   CREATE TABLE public.livro_atividade (
    "livro_atividadeID" integer NOT NULL,
    "livroID" integer,
    "atividadeID" integer
);
 #   DROP TABLE public.livro_atividade;
       public         heap    postgres    false            �            1259    32821 %   livro_atividade_livro_atividadeID_seq    SEQUENCE     �   ALTER TABLE public.livro_atividade ALTER COLUMN "livro_atividadeID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_atividade_livro_atividadeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    32822    livro_categoria    TABLE     �   CREATE TABLE public.livro_categoria (
    "livro_categoriaID" integer NOT NULL,
    "livroID" integer,
    "categoriaID" integer
);
 #   DROP TABLE public.livro_categoria;
       public         heap    postgres    false            �            1259    32825 %   livro_categoria_livro_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.livro_categoria ALTER COLUMN "livro_categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_categoria_livro_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    32826    livro_livroID_seq    SEQUENCE     �   ALTER TABLE public.livro ALTER COLUMN "livroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_livroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    32827    log    TABLE     �  CREATE TABLE public.log (
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
       public         heap    postgres    false            �            1259    32832    log_logID_seq    SEQUENCE     �   ALTER TABLE public.log ALTER COLUMN "logID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."log_logID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    32833    nacionalidade_autor    TABLE     �   CREATE TABLE public.nacionalidade_autor (
    "nacionalidade_autorID" integer NOT NULL,
    "autorID" integer,
    "nacionalidadeID" integer
);
 '   DROP TABLE public.nacionalidade_autor;
       public         heap    postgres    false            �            1259    32836 -   nacionalidade_autor_nacionalidade_autorID_seq    SEQUENCE       ALTER TABLE public.nacionalidade_autor ALTER COLUMN "nacionalidade_autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."nacionalidade_autor_nacionalidade_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    32837    rating    TABLE     �   CREATE TABLE public.rating (
    "ratingID" integer NOT NULL,
    "livroID" integer,
    "utilizadorID" integer,
    valor integer NOT NULL
);
    DROP TABLE public.rating;
       public         heap    postgres    false            �            1259    32840    rating_ratingID_seq    SEQUENCE     �   ALTER TABLE public.rating ALTER COLUMN "ratingID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."rating_ratingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    32841 
   utilizador    TABLE       CREATE TABLE public.utilizador (
    "utilizadorID" integer NOT NULL,
    nome text NOT NULL,
    "ADM" boolean DEFAULT false NOT NULL,
    "nivelPlano" integer DEFAULT 0 NOT NULL,
    email text NOT NULL,
    pass text NOT NULL,
    genero public.gen_check NOT NULL
);
    DROP TABLE public.utilizador;
       public         heap    postgres    false    930            �            1259    32848    utilizadorLivro    TABLE     �   CREATE TABLE public."utilizadorLivro" (
    "utilizadorLivroID" integer NOT NULL,
    utilizador integer,
    livro integer,
    lido boolean NOT NULL,
    favorito boolean DEFAULT false NOT NULL,
    percentagem integer DEFAULT 0 NOT NULL
);
 %   DROP TABLE public."utilizadorLivro";
       public         heap    postgres    false            �            1259    32853 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE     �   ALTER TABLE public."utilizadorLivro" ALTER COLUMN "utilizadorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizadorLivro_utilizadorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    32854    utilizador_utilizadorID_seq    SEQUENCE     �   ALTER TABLE public.utilizador ALTER COLUMN "utilizadorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_utilizadorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    32855    utilizador_voucher    TABLE     �   CREATE TABLE public.utilizador_voucher (
    "utilizador_voucherID" integer NOT NULL,
    "utilizadorID" integer,
    "voucherID" integer
);
 &   DROP TABLE public.utilizador_voucher;
       public         heap    postgres    false            �            1259    32858 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE       ALTER TABLE public.utilizador_voucher ALTER COLUMN "utilizador_voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_voucher_utilizador_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    32859    voucher    TABLE     X   CREATE TABLE public.voucher (
    "voucherID" integer NOT NULL,
    desconto integer
);
    DROP TABLE public.voucher;
       public         heap    postgres    false            �            1259    32862    voucher_voucherID_seq    SEQUENCE     �   ALTER TABLE public.voucher ALTER COLUMN "voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."voucher_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249            B          0    32769    Compra 
   TABLE DATA           f   COPY public."Compra" ("compraID", "utilizadorID", "planoID", preco, cartao, "dataCompra") FROM stdin;
    public          postgres    false    215   �       D          0    32773    Nacionalidade 
   TABLE DATA           K   COPY public."Nacionalidade" ("nacionalidadeID", nacionalidade) FROM stdin;
    public          postgres    false    217   l�       F          0    32779    Planos 
   TABLE DATA           5   COPY public."Planos" ("planosID", preco) FROM stdin;
    public          postgres    false    219   ��       H          0    32784 
   atividades 
   TABLE DATA           :   COPY public.atividades ("atividadesID", tipo) FROM stdin;
    public          postgres    false    221   ԑ       J          0    32790    autor 
   TABLE DATA           O   COPY public.autor ("autorID", nome, descricao, fotografia, morada) FROM stdin;
    public          postgres    false    223   �       K          0    32795 
   autorLivro 
   TABLE DATA           L   COPY public."autorLivro" ("autorLivroID", "autorID", "livroID") FROM stdin;
    public          postgres    false    224   ��       N          0    32800 	   categoria 
   TABLE DATA           8   COPY public.categoria ("categoriaID", nome) FROM stdin;
    public          postgres    false    227   ɒ       P          0    32806 
   comentario 
   TABLE DATA           g   COPY public.comentario ("comentarioID", "utilizadorID", "livroID", comentario_data, texto) FROM stdin;
    public          postgres    false    229   �       R          0    32812    livro 
   TABLE DATA           �   COPY public.livro ("livroID", titulo, "imgCapa", descricao, "faixaEtaria", paginas, audio, video, tipo, "paginaURL", "videoURL", "audioURL") FROM stdin;
    public          postgres    false    231   h�       S          0    32818    livro_atividade 
   TABLE DATA           X   COPY public.livro_atividade ("livro_atividadeID", "livroID", "atividadeID") FROM stdin;
    public          postgres    false    232   !�       U          0    32822    livro_categoria 
   TABLE DATA           X   COPY public.livro_categoria ("livro_categoriaID", "livroID", "categoriaID") FROM stdin;
    public          postgres    false    234   M�       X          0    32827    log 
   TABLE DATA           �   COPY public.log ("logID", "utilizadorID", "livroID", "compraID", log_data, lido, favorito, percentagem, comentario_data, comentario_texto, compra_preco, "compra_dataCompra", plano_preco, "comentarioID", "voucherID", voucher_desconto) FROM stdin;
    public          postgres    false    237   y�       Z          0    32833    nacionalidade_autor 
   TABLE DATA           d   COPY public.nacionalidade_autor ("nacionalidade_autorID", "autorID", "nacionalidadeID") FROM stdin;
    public          postgres    false    239   ��       \          0    32837    rating 
   TABLE DATA           N   COPY public.rating ("ratingID", "livroID", "utilizadorID", valor) FROM stdin;
    public          postgres    false    241   Ô       ^          0    32841 
   utilizador 
   TABLE DATA           d   COPY public.utilizador ("utilizadorID", nome, "ADM", "nivelPlano", email, pass, genero) FROM stdin;
    public          postgres    false    243   �       _          0    32848    utilizadorLivro 
   TABLE DATA           p   COPY public."utilizadorLivro" ("utilizadorLivroID", utilizador, livro, lido, favorito, percentagem) FROM stdin;
    public          postgres    false    244   [�       b          0    32855    utilizador_voucher 
   TABLE DATA           a   COPY public.utilizador_voucher ("utilizador_voucherID", "utilizadorID", "voucherID") FROM stdin;
    public          postgres    false    247   ��       d          0    32859    voucher 
   TABLE DATA           8   COPY public.voucher ("voucherID", desconto) FROM stdin;
    public          postgres    false    249   ��       l           0    0    Compra_compraID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Compra_compraID_seq"', 4, true);
          public          postgres    false    216            m           0    0 !   Nacionalidade_nacionalidadeID_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Nacionalidade_nacionalidadeID_seq"', 3, true);
          public          postgres    false    218            n           0    0    Planos_planosID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Planos_planosID_seq"', 3, true);
          public          postgres    false    220            o           0    0    atividades_atividadesID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."atividades_atividadesID_seq"', 3, true);
          public          postgres    false    222            p           0    0    autorLivro_autorLivroID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."autorLivro_autorLivroID_seq"', 3, true);
          public          postgres    false    225            q           0    0    autor_autorID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."autor_autorID_seq"', 3, true);
          public          postgres    false    226            r           0    0    categoria_categoriaID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."categoria_categoriaID_seq"', 3, true);
          public          postgres    false    228            s           0    0    comentario_comentarioID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."comentario_comentarioID_seq"', 4, true);
          public          postgres    false    230            t           0    0 %   livro_atividade_livro_atividadeID_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."livro_atividade_livro_atividadeID_seq"', 3, true);
          public          postgres    false    233            u           0    0 %   livro_categoria_livro_categoriaID_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."livro_categoria_livro_categoriaID_seq"', 3, true);
          public          postgres    false    235            v           0    0    livro_livroID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."livro_livroID_seq"', 3, true);
          public          postgres    false    236            w           0    0    log_logID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."log_logID_seq"', 1, false);
          public          postgres    false    238            x           0    0 -   nacionalidade_autor_nacionalidade_autorID_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public."nacionalidade_autor_nacionalidade_autorID_seq"', 3, true);
          public          postgres    false    240            y           0    0    rating_ratingID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."rating_ratingID_seq"', 3, true);
          public          postgres    false    242            z           0    0 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."utilizadorLivro_utilizadorLivroID_seq"', 3, true);
          public          postgres    false    245            {           0    0    utilizador_utilizadorID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."utilizador_utilizadorID_seq"', 3, true);
          public          postgres    false    246            |           0    0 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."utilizador_voucher_utilizador_voucherID_seq"', 3, true);
          public          postgres    false    248            }           0    0    voucher_voucherID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."voucher_voucherID_seq"', 3, true);
          public          postgres    false    250            {           2606    32864    Compra Compra_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY ("compraID");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Compra_pkey";
       public            postgres    false    215            }           2606    32866     Nacionalidade Nacionalidade_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Nacionalidade"
    ADD CONSTRAINT "Nacionalidade_pkey" PRIMARY KEY ("nacionalidadeID");
 N   ALTER TABLE ONLY public."Nacionalidade" DROP CONSTRAINT "Nacionalidade_pkey";
       public            postgres    false    217                       2606    32868    Planos Planos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Planos"
    ADD CONSTRAINT "Planos_pkey" PRIMARY KEY ("planosID");
 @   ALTER TABLE ONLY public."Planos" DROP CONSTRAINT "Planos_pkey";
       public            postgres    false    219            �           2606    32870    atividades atividades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY ("atividadesID");
 D   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_pkey;
       public            postgres    false    221            �           2606    32872    autorLivro autorLivro_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "autorLivro_pkey" PRIMARY KEY ("autorLivroID");
 H   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "autorLivro_pkey";
       public            postgres    false    224            �           2606    32874    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY ("autorID");
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    223            �           2606    32876    categoria categoria_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY ("categoriaID");
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    227            �           2606    32878    comentario comentario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY ("comentarioID");
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    229            �           2606    32991    utilizador email_unique 
   CONSTRAINT     S   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT email_unique UNIQUE (email);
 A   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT email_unique;
       public            postgres    false    243            �           2606    32880 $   livro_atividade livro_atividade_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_atividade_pkey PRIMARY KEY ("livro_atividadeID");
 N   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_atividade_pkey;
       public            postgres    false    232            �           2606    32882 $   livro_categoria livro_categoria_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria_pkey PRIMARY KEY ("livro_categoriaID");
 N   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria_pkey;
       public            postgres    false    234            �           2606    32884    livro livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY ("livroID");
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    231            �           2606    32886    log log_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY ("logID");
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    237            �           2606    32888 ,   nacionalidade_autor nacionalidade_autor_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT nacionalidade_autor_pkey PRIMARY KEY ("nacionalidade_autorID");
 V   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT nacionalidade_autor_pkey;
       public            postgres    false    239            �           2606    32890    rating rating_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY ("ratingID");
 <   ALTER TABLE ONLY public.rating DROP CONSTRAINT rating_pkey;
       public            postgres    false    241            �           2606    32892 $   utilizadorLivro utilizadorLivro_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "utilizadorLivro_pkey" PRIMARY KEY ("utilizadorLivroID");
 R   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "utilizadorLivro_pkey";
       public            postgres    false    244            �           2606    32894    utilizador utilizador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY ("utilizadorID");
 D   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT utilizador_pkey;
       public            postgres    false    243            �           2606    32896 *   utilizador_voucher utilizador_voucher_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher_pkey PRIMARY KEY ("utilizador_voucherID");
 T   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher_pkey;
       public            postgres    false    247            �           2606    32898    voucher voucher_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY ("voucherID");
 >   ALTER TABLE ONLY public.voucher DROP CONSTRAINT voucher_pkey;
       public            postgres    false    249            �           2620    33003    comentario valid_comen_date    TRIGGER     �   CREATE TRIGGER valid_comen_date BEFORE INSERT ON public.comentario FOR EACH ROW WHEN ((pg_trigger_depth() = 0)) EXECUTE FUNCTION public.valid_comen_date();
 4   DROP TRIGGER valid_comen_date ON public.comentario;
       public          postgres    false    229    251            �           2606    32899    autorLivro Autores    FK CONSTRAINT     ~   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "Autores" FOREIGN KEY ("autorID") REFERENCES public.autor("autorID");
 @   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "Autores";
       public          postgres    false    224    223    4739            �           2606    32904    rating Livro    FK CONSTRAINT     v   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Livro" FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 8   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Livro";
       public          postgres    false    4747    241    231            �           2606    32909    utilizadorLivro Livro    FK CONSTRAINT     }   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Livro" FOREIGN KEY (livro) REFERENCES public.livro("livroID");
 C   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Livro";
       public          postgres    false    244    231    4747            �           2606    32914    rating Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Utilizador" FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 =   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Utilizador";
       public          postgres    false    241    243    4761            �           2606    32919    utilizadorLivro Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Utilizador" FOREIGN KEY (utilizador) REFERENCES public.utilizador("utilizadorID");
 H   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Utilizador";
       public          postgres    false    4761    243    244            �           2606    32924    livro_atividade atividade_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT atividade_livro FOREIGN KEY ("atividadeID") REFERENCES public.atividades("atividadesID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT atividade_livro;
       public          postgres    false    232    4737    221            �           2606    32929 '   nacionalidade_autor autor_nacionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT autor_nacionalidade FOREIGN KEY ("autorID") REFERENCES public.autor("autorID") NOT VALID;
 Q   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT autor_nacionalidade;
       public          postgres    false    4739    239    223            �           2606    32934    livro_categoria categoria_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT categoria_livro FOREIGN KEY ("categoriaID") REFERENCES public.categoria("categoriaID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT categoria_livro;
       public          postgres    false    234    4743    227            �           2606    32939    comentario livro    FK CONSTRAINT     x   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT livro FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 :   ALTER TABLE ONLY public.comentario DROP CONSTRAINT livro;
       public          postgres    false    229    231    4747            �           2606    32944    livro_atividade livro_ativiadde    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_ativiadde FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_ativiadde;
       public          postgres    false    232    4747    231            �           2606    32949    livro_categoria livro_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria;
       public          postgres    false    4747    234    231            �           2606    32954    autorLivro livros    FK CONSTRAINT     {   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT livros FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 =   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT livros;
       public          postgres    false    224    4747    231            �           2606    32959 '   nacionalidade_autor nacionalidade_autor    FK CONSTRAINT     �   ALTER TABLE ONLY public.nacionalidade_autor
    ADD CONSTRAINT nacionalidade_autor FOREIGN KEY ("nacionalidadeID") REFERENCES public."Nacionalidade"("nacionalidadeID") NOT VALID;
 Q   ALTER TABLE ONLY public.nacionalidade_autor DROP CONSTRAINT nacionalidade_autor;
       public          postgres    false    217    239    4733            �           2606    32964    Compra plano_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT plano_utilizador FOREIGN KEY ("planoID") REFERENCES public."Planos"("planosID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT plano_utilizador;
       public          postgres    false    4735    219    215            �           2606    32969    comentario utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT utilizador FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 ?   ALTER TABLE ONLY public.comentario DROP CONSTRAINT utilizador;
       public          postgres    false    4761    229    243            �           2606    32974    Compra utilizador_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT utilizador_plano FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT utilizador_plano;
       public          postgres    false    215    243    4761            �           2606    32979 %   utilizador_voucher utilizador_voucher    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher;
       public          postgres    false    247    243    4761            �           2606    32984 %   utilizador_voucher voucher_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT voucher_utilizador FOREIGN KEY ("voucherID") REFERENCES public.voucher("voucherID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT voucher_utilizador;
       public          postgres    false    247    4767    249            B   E   x�-���@���.�����.�?E �Y�aPI�1�,�gYF%
_
�����>kw��Z��>��zP6      D   ,   x�3�t�I�M��2��/*)M/M-�2���LO-�L����� ɥ
T      F      x�3�440�2�\�`ʀ+F��� 3��      H   3   x�3�L���/�,�2�LI-N��H,�2�,,MM*J�MNLJMN,����� 0�+      J   v   x�M�A
�0��+�@��V�^�ظ�Xr��!�����δ���pK.;��ӛ�T(��u��%� g���]-V*��n�k��KY~�KB�u<etKc�������qʏ��?� 2�      K      x�3�4�4�2�B.cN ����� !��      N   +   x�3�I-*�/�2���M�KN�2�t,K�+)-J����� ��
      P   T   x�3�4B##c]CC]CcN��̒|��̼����|.#N0��q�%�+����f*$�frs� �C�	���\1z\\\ xp�      R   �   x�M�K
�0D��)|�S�-t�E(=@6n�$�F6������F3��p3�_�p! ���4�eC
+����tթ�1��}���a��W�p�����u�OCq`HZµv���݂Q��&��D�֜;p��E�1�J��$�$~�;ľ���5��~rat+t��?R�N�      S      x�3�4�4�2�4�Ɯ@����� !��      U      x�3�4�4�2�B.cN ����� !��      X      x������ � �      Z      x�3�4�4�2�4�4�2�B�=... !��      \      x�3�4BS.# i�i�e"9�b���� 4bq      ^   Y   x�3�*��L�4�,*�tH�M���K�����9}��8��J���J�@,$E`����Pib^ijg	�g.���"`na	40F��� Us#;      _   *   x�3�4� 440�2��4 �Ԑ˘Ӏ�+F��� �{      b      x�3�4�4�2�B.c ۘ+F��� !��      d      x�3�44�2�42�2�46������ ��     