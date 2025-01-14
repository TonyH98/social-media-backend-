PGDMP     #                     |            social    15.1    15.1 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    79858    social    DATABASE     �   CREATE DATABASE social WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE social;
                postgres    false            �            1259    80029    favorite    TABLE     �   CREATE TABLE public.favorite (
    id integer NOT NULL,
    favorites boolean DEFAULT true,
    selected boolean DEFAULT false,
    users_id integer,
    creator_id integer,
    posts_id integer,
    reply_id integer,
    poll_id integer
);
    DROP TABLE public.favorite;
       public         heap    postgres    false            �            1259    80028    favorite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.favorite_id_seq;
       public          postgres    false    230            �           0    0    favorite_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.favorite_id_seq OWNED BY public.favorite.id;
          public          postgres    false    229            �            1259    79933    hashtags    TABLE     N   CREATE TABLE public.hashtags (
    id integer NOT NULL,
    tag_names text
);
    DROP TABLE public.hashtags;
       public         heap    postgres    false            �            1259    79932    hashtags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.hashtags_id_seq;
       public          postgres    false    222            �           0    0    hashtags_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;
          public          postgres    false    221            �            1259    80095    memberships    TABLE     �   CREATE TABLE public.memberships (
    id integer NOT NULL,
    product_name text,
    images text,
    description text,
    price integer
);
    DROP TABLE public.memberships;
       public         heap    postgres    false            �            1259    80094    memberships_id_seq    SEQUENCE     �   CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.memberships_id_seq;
       public          postgres    false    235            �           0    0    memberships_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;
          public          postgres    false    234            �            1259    80061    notifications    TABLE     �   CREATE TABLE public.notifications (
    id integer NOT NULL,
    users_id integer,
    sender_id integer,
    posts_id integer,
    reply_id integer,
    poll_id integer,
    is_read boolean DEFAULT false,
    selected boolean DEFAULT false
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    80060    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    233            �           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    232            �            1259    79914 
   poll_votes    TABLE     �   CREATE TABLE public.poll_votes (
    poll_id integer,
    user_id integer,
    selected_option text,
    vote_date date DEFAULT CURRENT_DATE
);
    DROP TABLE public.poll_votes;
       public         heap    postgres    false            �            1259    79895    polls    TABLE     �   CREATE TABLE public.polls (
    id integer NOT NULL,
    question character varying(100) NOT NULL,
    options jsonb NOT NULL,
    user_id integer,
    user_name text,
    answer text,
    date_created date DEFAULT CURRENT_DATE
);
    DROP TABLE public.polls;
       public         heap    postgres    false            �            1259    79894    polls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.polls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.polls_id_seq;
       public          postgres    false    219            �           0    0    polls_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.polls_id_seq OWNED BY public.polls.id;
          public          postgres    false    218            �            1259    79997    post_hashtags    TABLE     �   CREATE TABLE public.post_hashtags (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    reply_id integer,
    poll_id integer,
    hashtag_id integer
);
 !   DROP TABLE public.post_hashtags;
       public         heap    postgres    false            �            1259    79996    post_hashtags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.post_hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.post_hashtags_id_seq;
       public          postgres    false    228            �           0    0    post_hashtags_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.post_hashtags_id_seq OWNED BY public.post_hashtags.id;
          public          postgres    false    227            �            1259    79943    post_reactions    TABLE     6  CREATE TABLE public.post_reactions (
    user_id integer,
    post_id integer,
    creator_id integer,
    reaction_type character varying(10),
    CONSTRAINT post_reactions_reaction_type_check CHECK (((reaction_type)::text = ANY ((ARRAY['like'::character varying, 'dislike'::character varying])::text[])))
);
 "   DROP TABLE public.post_reactions;
       public         heap    postgres    false            �            1259    79875    posts    TABLE     L  CREATE TABLE public.posts (
    id integer NOT NULL,
    user_name text,
    user_id integer,
    content text,
    posts_img text,
    gif text,
    repost boolean,
    repost_id integer,
    repost_counter integer,
    url text,
    url_img text,
    url_title text,
    pin boolean,
    date_created date DEFAULT CURRENT_DATE
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    79874    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    217            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    216            �            1259    79958    replies    TABLE       CREATE TABLE public.replies (
    id integer NOT NULL,
    posts_id integer,
    poll_id integer,
    user_id integer,
    content character varying(500),
    posts_img text,
    gif text,
    url text,
    url_img text,
    url_title text,
    date_created date DEFAULT CURRENT_DATE
);
    DROP TABLE public.replies;
       public         heap    postgres    false            �            1259    79957    replies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.replies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.replies_id_seq;
       public          postgres    false    225            �           0    0    replies_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.replies_id_seq OWNED BY public.replies.id;
          public          postgres    false    224            �            1259    79982    reply_reactions    TABLE     9  CREATE TABLE public.reply_reactions (
    user_id integer,
    reply_id integer,
    creator_id integer,
    reaction_type character varying(10),
    CONSTRAINT reply_reactions_reaction_type_check CHECK (((reaction_type)::text = ANY ((ARRAY['like'::character varying, 'dislike'::character varying])::text[])))
);
 #   DROP TABLE public.reply_reactions;
       public         heap    postgres    false            �            1259    79860    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    email text NOT NULL,
    profile_img text,
    banner_img text,
    dob date,
    bio text,
    profile_name text,
    notifications boolean DEFAULT false,
    date_created date DEFAULT CURRENT_DATE,
    links text,
    dark_mode boolean,
    password text NOT NULL,
    verification text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    80118    users_block    TABLE     O   CREATE TABLE public.users_block (
    user_id integer,
    block_id integer
);
    DROP TABLE public.users_block;
       public         heap    postgres    false            �            1259    80042    users_followers    TABLE     �   CREATE TABLE public.users_followers (
    follow boolean DEFAULT true,
    selected boolean DEFAULT false,
    added boolean DEFAULT true,
    user_id integer,
    following_id integer
);
 #   DROP TABLE public.users_followers;
       public         heap    postgres    false            �            1259    79859    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �            1259    80103    users_memberships    TABLE     �   CREATE TABLE public.users_memberships (
    user_id integer,
    memberships_id integer,
    date_created date DEFAULT CURRENT_DATE,
    quantity integer DEFAULT 1
);
 %   DROP TABLE public.users_memberships;
       public         heap    postgres    false            �           2604    80032    favorite id    DEFAULT     j   ALTER TABLE ONLY public.favorite ALTER COLUMN id SET DEFAULT nextval('public.favorite_id_seq'::regclass);
 :   ALTER TABLE public.favorite ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    79936    hashtags id    DEFAULT     j   ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);
 :   ALTER TABLE public.hashtags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    80098    memberships id    DEFAULT     p   ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);
 =   ALTER TABLE public.memberships ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    80064    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    79898    polls id    DEFAULT     d   ALTER TABLE ONLY public.polls ALTER COLUMN id SET DEFAULT nextval('public.polls_id_seq'::regclass);
 7   ALTER TABLE public.polls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    80000    post_hashtags id    DEFAULT     t   ALTER TABLE ONLY public.post_hashtags ALTER COLUMN id SET DEFAULT nextval('public.post_hashtags_id_seq'::regclass);
 ?   ALTER TABLE public.post_hashtags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    79878    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    79961 
   replies id    DEFAULT     h   ALTER TABLE ONLY public.replies ALTER COLUMN id SET DEFAULT nextval('public.replies_id_seq'::regclass);
 9   ALTER TABLE public.replies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    79863    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �          0    80029    favorite 
   TABLE DATA           n   COPY public.favorite (id, favorites, selected, users_id, creator_id, posts_id, reply_id, poll_id) FROM stdin;
    public          postgres    false    230   d�       �          0    79933    hashtags 
   TABLE DATA           1   COPY public.hashtags (id, tag_names) FROM stdin;
    public          postgres    false    222   ��       �          0    80095    memberships 
   TABLE DATA           S   COPY public.memberships (id, product_name, images, description, price) FROM stdin;
    public          postgres    false    235          �          0    80061    notifications 
   TABLE DATA           p   COPY public.notifications (id, users_id, sender_id, posts_id, reply_id, poll_id, is_read, selected) FROM stdin;
    public          postgres    false    233   _�       �          0    79914 
   poll_votes 
   TABLE DATA           R   COPY public.poll_votes (poll_id, user_id, selected_option, vote_date) FROM stdin;
    public          postgres    false    220   |�       �          0    79895    polls 
   TABLE DATA           `   COPY public.polls (id, question, options, user_id, user_name, answer, date_created) FROM stdin;
    public          postgres    false    219   ��       �          0    79997    post_hashtags 
   TABLE DATA           \   COPY public.post_hashtags (id, user_id, post_id, reply_id, poll_id, hashtag_id) FROM stdin;
    public          postgres    false    228   C�       �          0    79943    post_reactions 
   TABLE DATA           U   COPY public.post_reactions (user_id, post_id, creator_id, reaction_type) FROM stdin;
    public          postgres    false    223   r�       �          0    79875    posts 
   TABLE DATA           �   COPY public.posts (id, user_name, user_id, content, posts_img, gif, repost, repost_id, repost_counter, url, url_img, url_title, pin, date_created) FROM stdin;
    public          postgres    false    217   ��       �          0    79958    replies 
   TABLE DATA           �   COPY public.replies (id, posts_id, poll_id, user_id, content, posts_img, gif, url, url_img, url_title, date_created) FROM stdin;
    public          postgres    false    225   �       �          0    79982    reply_reactions 
   TABLE DATA           W   COPY public.reply_reactions (user_id, reply_id, creator_id, reaction_type) FROM stdin;
    public          postgres    false    226   Y�       �          0    79860    users 
   TABLE DATA           �   COPY public.users (id, username, firstname, lastname, email, profile_img, banner_img, dob, bio, profile_name, notifications, date_created, links, dark_mode, password, verification) FROM stdin;
    public          postgres    false    215   v�       �          0    80118    users_block 
   TABLE DATA           8   COPY public.users_block (user_id, block_id) FROM stdin;
    public          postgres    false    237   /�       �          0    80042    users_followers 
   TABLE DATA           Y   COPY public.users_followers (follow, selected, added, user_id, following_id) FROM stdin;
    public          postgres    false    231   L�       �          0    80103    users_memberships 
   TABLE DATA           \   COPY public.users_memberships (user_id, memberships_id, date_created, quantity) FROM stdin;
    public          postgres    false    236   i�       �           0    0    favorite_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.favorite_id_seq', 10, true);
          public          postgres    false    229            �           0    0    hashtags_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.hashtags_id_seq', 1, true);
          public          postgres    false    221            �           0    0    memberships_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.memberships_id_seq', 1, true);
          public          postgres    false    234            �           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          postgres    false    232            �           0    0    polls_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.polls_id_seq', 5, true);
          public          postgres    false    218            �           0    0    post_hashtags_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.post_hashtags_id_seq', 2, true);
          public          postgres    false    227            �           0    0    posts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.posts_id_seq', 2, true);
          public          postgres    false    216            �           0    0    replies_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.replies_id_seq', 5, true);
          public          postgres    false    224            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    214            �           2606    80036    favorite favorite_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_pkey;
       public            postgres    false    230            �           2606    79940    hashtags hashtags_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.hashtags DROP CONSTRAINT hashtags_pkey;
       public            postgres    false    222            �           2606    80102    memberships memberships_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.memberships DROP CONSTRAINT memberships_pkey;
       public            postgres    false    235            �           2606    80068     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    233            �           2606    79921 )   poll_votes poll_votes_poll_id_user_id_key 
   CONSTRAINT     p   ALTER TABLE ONLY public.poll_votes
    ADD CONSTRAINT poll_votes_poll_id_user_id_key UNIQUE (poll_id, user_id);
 S   ALTER TABLE ONLY public.poll_votes DROP CONSTRAINT poll_votes_poll_id_user_id_key;
       public            postgres    false    220    220            �           2606    79903    polls polls_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.polls DROP CONSTRAINT polls_pkey;
       public            postgres    false    219            �           2606    80002     post_hashtags post_hashtags_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_pkey;
       public            postgres    false    228            �           2606    79883    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    217            �           2606    79966    replies replies_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_pkey;
       public            postgres    false    225            �           2606    79942    hashtags unique_tag_name 
   CONSTRAINT     X   ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT unique_tag_name UNIQUE (tag_names);
 B   ALTER TABLE ONLY public.hashtags DROP CONSTRAINT unique_tag_name;
       public            postgres    false    222            �           2606    79873    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            �           2606    80049 >   users_followers users_followers_user_id_following_id_added_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_followers
    ADD CONSTRAINT users_followers_user_id_following_id_added_key UNIQUE (user_id, following_id, added);
 h   ALTER TABLE ONLY public.users_followers DROP CONSTRAINT users_followers_user_id_following_id_added_key;
       public            postgres    false    231    231    231            �           2606    79869    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    79871    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    215                       2606    80037    favorite favorite_users_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.favorite DROP CONSTRAINT favorite_users_id_fkey;
       public          postgres    false    3554    230    215                       2606    80089 (   notifications notifications_poll_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES public.polls(id);
 R   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_poll_id_fkey;
       public          postgres    false    3560    219    233                       2606    80079 )   notifications notifications_posts_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_posts_id_fkey FOREIGN KEY (posts_id) REFERENCES public.posts(id);
 S   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_posts_id_fkey;
       public          postgres    false    233    3558    217                       2606    80084 )   notifications notifications_reply_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_reply_id_fkey FOREIGN KEY (reply_id) REFERENCES public.replies(id);
 S   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_reply_id_fkey;
       public          postgres    false    233    225    3568                       2606    80074 *   notifications notifications_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_sender_id_fkey;
       public          postgres    false    3554    233    215                       2606    80069 )   notifications notifications_users_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id);
 S   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_users_id_fkey;
       public          postgres    false    3554    233    215            �           2606    79922 "   poll_votes poll_votes_poll_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.poll_votes
    ADD CONSTRAINT poll_votes_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES public.polls(id);
 L   ALTER TABLE ONLY public.poll_votes DROP CONSTRAINT poll_votes_poll_id_fkey;
       public          postgres    false    220    3560    219                        2606    79927 "   poll_votes poll_votes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.poll_votes
    ADD CONSTRAINT poll_votes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.poll_votes DROP CONSTRAINT poll_votes_user_id_fkey;
       public          postgres    false    220    215    3554            �           2606    79904    polls polls_user_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.polls DROP CONSTRAINT polls_user_id_fkey;
       public          postgres    false    215    219    3554            �           2606    79909    polls polls_user_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_user_name_fkey FOREIGN KEY (user_name) REFERENCES public.users(username);
 D   ALTER TABLE ONLY public.polls DROP CONSTRAINT polls_user_name_fkey;
       public          postgres    false    215    3556    219                       2606    80023 +   post_hashtags post_hashtags_hashtag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_hashtag_id_fkey FOREIGN KEY (hashtag_id) REFERENCES public.hashtags(id);
 U   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_hashtag_id_fkey;
       public          postgres    false    222    228    3564            	           2606    80018 (   post_hashtags post_hashtags_poll_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES public.polls(id);
 R   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_poll_id_fkey;
       public          postgres    false    228    219    3560            
           2606    80008 (   post_hashtags post_hashtags_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);
 R   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_post_id_fkey;
       public          postgres    false    228    3558    217                       2606    80013 )   post_hashtags post_hashtags_reply_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_reply_id_fkey FOREIGN KEY (reply_id) REFERENCES public.replies(id);
 S   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_reply_id_fkey;
       public          postgres    false    228    225    3568                       2606    80003 (   post_hashtags post_hashtags_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_hashtags
    ADD CONSTRAINT post_hashtags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.post_hashtags DROP CONSTRAINT post_hashtags_user_id_fkey;
       public          postgres    false    228    3554    215                       2606    79952 *   post_reactions post_reactions_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_reactions
    ADD CONSTRAINT post_reactions_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);
 T   ALTER TABLE ONLY public.post_reactions DROP CONSTRAINT post_reactions_post_id_fkey;
       public          postgres    false    223    217    3558                       2606    79947 *   post_reactions post_reactions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_reactions
    ADD CONSTRAINT post_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.post_reactions DROP CONSTRAINT post_reactions_user_id_fkey;
       public          postgres    false    215    223    3554            �           2606    79889    posts posts_user_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public          postgres    false    3554    215    217            �           2606    79884    posts posts_user_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_name_fkey FOREIGN KEY (user_name) REFERENCES public.users(username);
 D   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_name_fkey;
       public          postgres    false    3556    217    215                       2606    79972    replies replies_poll_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES public.polls(id);
 F   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_poll_id_fkey;
       public          postgres    false    3560    225    219                       2606    79967    replies replies_posts_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_posts_id_fkey FOREIGN KEY (posts_id) REFERENCES public.posts(id);
 G   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_posts_id_fkey;
       public          postgres    false    217    225    3558                       2606    79977    replies replies_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.replies DROP CONSTRAINT replies_user_id_fkey;
       public          postgres    false    215    3554    225                       2606    79991 -   reply_reactions reply_reactions_reply_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reply_reactions
    ADD CONSTRAINT reply_reactions_reply_id_fkey FOREIGN KEY (reply_id) REFERENCES public.replies(id);
 W   ALTER TABLE ONLY public.reply_reactions DROP CONSTRAINT reply_reactions_reply_id_fkey;
       public          postgres    false    3568    225    226                       2606    79986 ,   reply_reactions reply_reactions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reply_reactions
    ADD CONSTRAINT reply_reactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.reply_reactions DROP CONSTRAINT reply_reactions_user_id_fkey;
       public          postgres    false    226    215    3554                       2606    80055 1   users_followers users_followers_following_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_followers
    ADD CONSTRAINT users_followers_following_id_fkey FOREIGN KEY (following_id) REFERENCES public.users(id);
 [   ALTER TABLE ONLY public.users_followers DROP CONSTRAINT users_followers_following_id_fkey;
       public          postgres    false    215    231    3554                       2606    80050 ,   users_followers users_followers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_followers
    ADD CONSTRAINT users_followers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.users_followers DROP CONSTRAINT users_followers_user_id_fkey;
       public          postgres    false    231    3554    215                       2606    80113 7   users_memberships users_memberships_memberships_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_memberships
    ADD CONSTRAINT users_memberships_memberships_id_fkey FOREIGN KEY (memberships_id) REFERENCES public.memberships(id);
 a   ALTER TABLE ONLY public.users_memberships DROP CONSTRAINT users_memberships_memberships_id_fkey;
       public          postgres    false    3578    235    236                       2606    80108 0   users_memberships users_memberships_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_memberships
    ADD CONSTRAINT users_memberships_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.users_memberships DROP CONSTRAINT users_memberships_user_id_fkey;
       public          postgres    false    236    3554    215            �   (   x�3�,�L�4�? �2�1������AEb���� 4�      �      x�3�T�H��������       �   �   x�ɱ
�0 �9���:IJ��
E(�N��˙^ӫ�]hb�^��*sW�8A;}�9�t(K��c��v��\���m�]���q��kOE�ˌ��̍<�J���={̬/�m ����,~!L�CԔL$!���鬵?r�1D      �      x������ � �      �   $   x�3�4�t�4202�50�5��2
8"��qqq z�      �   �   x�3�I-.��KW���ጮV*I�(Q�RPrT�QPJ�/���ju�N(�J�����!�y����FF&����\�p��R��v(��&����� �]����2�T�H����i�nsp� F��� ��M�      �      x�3�4�4��!C.# �6�b���� ]�M      �      x������ � �      �   H   x�3��ϫ����4�I-.��+����L���4 ��id`d�k`�k`�e��G�#5''_��6K�=... o�      �   b   x�3��!C��g6q���pB������D��P�����ʐ3�8%�:c�����̼t��Ԃ���b<ZL���Qg���4/%5-3/5��MW� ն8�      �      x������ � �      �   �  x��Ao�@���W��u��1`�ThJ�)�(�(R����ۻ�ǘ__B�������4�i�>�Z˺���eZs���³�o�j�i�RGT��qR��A�8h�JD�Z�3c��rZERY#��4��,3�G���c�j�"%���(�ޫ�HQv��8\b��J4Q\�tXbP�I�QL�&	K��M��#6H�t*K�I�tRBv�5�� )g�!��GF�?������!q�uwŪKW�5�G=�P���z�?�}/黴���^&/�=���,r��B8�w��S�T�_����񏵟��{_|n�v��x����U�Qiw�񸚷�.^�����H������(ߪ�O�/�0�m�k\-z��iQ9���E�ܬ#����b���R��~n��Ԉ�5��S�`�D������-dy�g����!b      �      x������ � �      �      x������ � �      �      x������ � �     