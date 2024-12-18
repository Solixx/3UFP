PGDMP  3                	    {           bibliotecaLivros    16.0    16.0 A               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16501    bibliotecaLivros    DATABASE     �   CREATE DATABASE "bibliotecaLivros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Portugal.1252';
 "   DROP DATABASE "bibliotecaLivros";
                postgres    false            �            1259    16680 
   atividades    TABLE     `   CREATE TABLE public.atividades (
    "atividadesID" integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.atividades;
       public         heap    postgres    false            �            1259    16679    atividades_atividadesID_seq    SEQUENCE     �   ALTER TABLE public.atividades ALTER COLUMN "atividadesID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."atividades_atividadesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16666    autor    TABLE     �   CREATE TABLE public.autor (
    "autorID" integer NOT NULL,
    nome text NOT NULL,
    nacionalidade text NOT NULL,
    descricao text NOT NULL,
    fotografia text,
    morada text NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    16674 
   autorLivro    TABLE     x   CREATE TABLE public."autorLivro" (
    "autorLivroID" integer NOT NULL,
    "autorID" integer,
    "livroID" integer
);
     DROP TABLE public."autorLivro";
       public         heap    postgres    false            �            1259    16673    autorLivro_autorLivroID_seq    SEQUENCE     �   ALTER TABLE public."autorLivro" ALTER COLUMN "autorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autorLivro_autorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16665    autor_autorID_seq    SEQUENCE     �   ALTER TABLE public.autor ALTER COLUMN "autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autor_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16688 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    "categoriaID" integer NOT NULL,
    nome text NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16687    categoria_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN "categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."categoria_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    16696 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    "comentarioID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    comentaio_data date NOT NULL,
    texto text NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    16695    comentario_comentarioID_seq    SEQUENCE     �   ALTER TABLE public.comentario ALTER COLUMN "comentarioID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."comentario_comentarioID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    16657    livro    TABLE     s  CREATE TABLE public.livro (
    "livroID" integer NOT NULL,
    autor integer,
    categoria integer,
    atividades integer,
    titulo text NOT NULL,
    "imgCapa" text NOT NULL,
    descricao text NOT NULL,
    "faixaEtaria" integer NOT NULL,
    paginas integer NOT NULL,
    audio boolean NOT NULL,
    video boolean NOT NULL,
    tipo integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.livro;
       public         heap    postgres    false            �            1259    16656    livro_livroID_seq    SEQUENCE     �   ALTER TABLE public.livro ALTER COLUMN "livroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_livroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16643    log    TABLE     m   CREATE TABLE public.log (
    "logID" integer NOT NULL,
    "utilizadorLivros" integer,
    log_data date
);
    DROP TABLE public.log;
       public         heap    postgres    false            �            1259    16642    log_logID_seq    SEQUENCE     �   ALTER TABLE public.log ALTER COLUMN "logID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."log_logID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16704    rating    TABLE     �   CREATE TABLE public.rating (
    "ratingID" integer NOT NULL,
    "livroID" integer,
    "utilizadorID" integer,
    valor integer NOT NULL
);
    DROP TABLE public.rating;
       public         heap    postgres    false            �            1259    16703    rating_ratingID_seq    SEQUENCE     �   ALTER TABLE public.rating ALTER COLUMN "ratingID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."rating_ratingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    16634 
   utilizador    TABLE     |   CREATE TABLE public.utilizador (
    "utilizadorID" integer NOT NULL,
    nome text NOT NULL,
    tipo integer DEFAULT 0
);
    DROP TABLE public.utilizador;
       public         heap    postgres    false            �            1259    16649    utilizadorLivro    TABLE     �   CREATE TABLE public."utilizadorLivro" (
    "utilizadorLivroID" integer NOT NULL,
    utilizador integer,
    livro integer,
    tipo integer NOT NULL,
    favorito boolean DEFAULT false NOT NULL,
    percentagem integer DEFAULT 0 NOT NULL
);
 %   DROP TABLE public."utilizadorLivro";
       public         heap    postgres    false            �            1259    16648 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE     �   ALTER TABLE public."utilizadorLivro" ALTER COLUMN "utilizadorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizadorLivro_utilizadorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16633    utilizador_utilizadorID_seq    SEQUENCE     �   ALTER TABLE public.utilizador ALTER COLUMN "utilizadorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_utilizadorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216                      0    16680 
   atividades 
   TABLE DATA           :   COPY public.atividades ("atividadesID", tipo) FROM stdin;
    public          postgres    false    228   M                 0    16666    autor 
   TABLE DATA           ^   COPY public.autor ("autorID", nome, nacionalidade, descricao, fotografia, morada) FROM stdin;
    public          postgres    false    224   2M                 0    16674 
   autorLivro 
   TABLE DATA           L   COPY public."autorLivro" ("autorLivroID", "autorID", "livroID") FROM stdin;
    public          postgres    false    226   OM                 0    16688 	   categoria 
   TABLE DATA           8   COPY public.categoria ("categoriaID", nome) FROM stdin;
    public          postgres    false    230   lM       
          0    16696 
   comentario 
   TABLE DATA           f   COPY public.comentario ("comentarioID", "utilizadorID", "livroID", comentaio_data, texto) FROM stdin;
    public          postgres    false    232   �M                  0    16657    livro 
   TABLE DATA           �   COPY public.livro ("livroID", autor, categoria, atividades, titulo, "imgCapa", descricao, "faixaEtaria", paginas, audio, video, tipo) FROM stdin;
    public          postgres    false    222   �M       �          0    16643    log 
   TABLE DATA           D   COPY public.log ("logID", "utilizadorLivros", log_data) FROM stdin;
    public          postgres    false    218   �M                 0    16704    rating 
   TABLE DATA           N   COPY public.rating ("ratingID", "livroID", "utilizadorID", valor) FROM stdin;
    public          postgres    false    234   �M       �          0    16634 
   utilizador 
   TABLE DATA           @   COPY public.utilizador ("utilizadorID", nome, tipo) FROM stdin;
    public          postgres    false    216   �M       �          0    16649    utilizadorLivro 
   TABLE DATA           p   COPY public."utilizadorLivro" ("utilizadorLivroID", utilizador, livro, tipo, favorito, percentagem) FROM stdin;
    public          postgres    false    220   N                  0    0    atividades_atividadesID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."atividades_atividadesID_seq"', 1, false);
          public          postgres    false    227                       0    0    autorLivro_autorLivroID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."autorLivro_autorLivroID_seq"', 1, false);
          public          postgres    false    225                       0    0    autor_autorID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."autor_autorID_seq"', 1, false);
          public          postgres    false    223                       0    0    categoria_categoriaID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."categoria_categoriaID_seq"', 1, false);
          public          postgres    false    229                       0    0    comentario_comentarioID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."comentario_comentarioID_seq"', 1, false);
          public          postgres    false    231                       0    0    livro_livroID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."livro_livroID_seq"', 1, false);
          public          postgres    false    221                       0    0    log_logID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."log_logID_seq"', 1, false);
          public          postgres    false    217                       0    0    rating_ratingID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."rating_ratingID_seq"', 1, false);
          public          postgres    false    233                       0    0 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."utilizadorLivro_utilizadorLivroID_seq"', 1, false);
          public          postgres    false    219                       0    0    utilizador_utilizadorID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."utilizador_utilizadorID_seq"', 1, false);
          public          postgres    false    215            X           2606    16686    atividades atividades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY ("atividadesID");
 D   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_pkey;
       public            postgres    false    228            V           2606    16678    autorLivro autorLivro_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "autorLivro_pkey" PRIMARY KEY ("autorLivroID");
 H   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "autorLivro_pkey";
       public            postgres    false    226            T           2606    16672    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY ("autorID");
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    224            Z           2606    16694    categoria categoria_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY ("categoriaID");
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    230            \           2606    16702    comentario comentario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY ("comentarioID");
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    232            R           2606    16664    livro livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY ("livroID");
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    222            N           2606    16647    log log_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY ("logID");
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    218            ^           2606    16708    rating rating_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY ("ratingID");
 <   ALTER TABLE ONLY public.rating DROP CONSTRAINT rating_pkey;
       public            postgres    false    234            P           2606    16655 $   utilizadorLivro utilizadorLivro_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "utilizadorLivro_pkey" PRIMARY KEY ("utilizadorLivroID");
 R   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "utilizadorLivro_pkey";
       public            postgres    false    220            L           2606    16641    utilizador utilizador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY ("utilizadorID");
 D   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT utilizador_pkey;
       public            postgres    false    216            b           2606    16729    livro Atividades    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT "Atividades" FOREIGN KEY (atividades) REFERENCES public.atividades("atividadesID");
 <   ALTER TABLE ONLY public.livro DROP CONSTRAINT "Atividades";
       public          postgres    false    222    228    4696            d           2606    16739    autorLivro Autores    FK CONSTRAINT     ~   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "Autores" FOREIGN KEY ("autorID") REFERENCES public.autor("autorID");
 @   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "Autores";
       public          postgres    false    4692    224    226            `           2606    16719    utilizadorLivro Livro    FK CONSTRAINT     }   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Livro" FOREIGN KEY (livro) REFERENCES public.livro("livroID");
 C   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Livro";
       public          postgres    false    4690    220    222            h           2606    16759    rating Livro    FK CONSTRAINT     v   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Livro" FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 8   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Livro";
       public          postgres    false    234    222    4690            a           2606    16714    utilizadorLivro Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Utilizador" FOREIGN KEY (utilizador) REFERENCES public.utilizador("utilizadorID");
 H   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Utilizador";
       public          postgres    false    216    4684    220            i           2606    16754    rating Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Utilizador" FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 =   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Utilizador";
       public          postgres    false    216    234    4684            c           2606    16724    livro categorias    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT categorias FOREIGN KEY (categoria) REFERENCES public.categoria("categoriaID");
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT categorias;
       public          postgres    false    222    230    4698            f           2606    16749    comentario livro    FK CONSTRAINT     x   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT livro FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 :   ALTER TABLE ONLY public.comentario DROP CONSTRAINT livro;
       public          postgres    false    232    4690    222            e           2606    16734    autorLivro livros    FK CONSTRAINT     {   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT livros FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 =   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT livros;
       public          postgres    false    4690    222    226            g           2606    16744    comentario utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT utilizador FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 ?   ALTER TABLE ONLY public.comentario DROP CONSTRAINT utilizador;
       public          postgres    false    4684    232    216            _           2606    16709    log utilizadorLivro    FK CONSTRAINT     �   ALTER TABLE ONLY public.log
    ADD CONSTRAINT "utilizadorLivro" FOREIGN KEY ("utilizadorLivros") REFERENCES public."utilizadorLivro"("utilizadorLivroID");
 ?   ALTER TABLE ONLY public.log DROP CONSTRAINT "utilizadorLivro";
       public          postgres    false    218    220    4688                  x������ � �            x������ � �            x������ � �            x������ � �      
      x������ � �             x������ � �      �      x������ � �            x������ � �      �      x������ � �      �      x������ � �     