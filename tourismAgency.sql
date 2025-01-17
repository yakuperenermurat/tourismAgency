PGDMP  '                    |            turizmAcentesi    16.2    16.2 /    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    25719    turizmAcentesi    DATABASE     r   CREATE DATABASE "turizmAcentesi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
     DROP DATABASE "turizmAcentesi";
                postgres    false            �            1259    25865    facility    TABLE     |  CREATE TABLE public.facility (
    facility_id integer NOT NULL,
    facility_hotel_id integer NOT NULL,
    facility_free_park boolean NOT NULL,
    facility_free_wifi boolean NOT NULL,
    facility_pool boolean NOT NULL,
    facility_gym boolean NOT NULL,
    facility_concierge boolean NOT NULL,
    facility_spa boolean NOT NULL,
    facility_room_service boolean NOT NULL
);
    DROP TABLE public.facility;
       public         heap    postgres    false            �            1259    25864    facility_facility_id_seq    SEQUENCE     �   ALTER TABLE public.facility ALTER COLUMN facility_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facility_facility_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    25798    hotel    TABLE     �  CREATE TABLE public.hotel (
    hotel_id integer NOT NULL,
    hotel_name character varying(100) NOT NULL,
    hotel_address character varying(255) NOT NULL,
    hotel_city character varying(50) NOT NULL,
    hotel_region character varying(50) NOT NULL,
    hotel_email character varying(100) NOT NULL,
    hotel_phone character varying(20) NOT NULL,
    hotel_stars character varying(7) NOT NULL,
    hotel_facility_id integer NOT NULL,
    hotel_pension_type_id integer NOT NULL
);
    DROP TABLE public.hotel;
       public         heap    postgres    false            �            1259    25797    hotel_hotel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotel_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotel_hotel_id_seq;
       public          postgres    false    218            A           0    0    hotel_hotel_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotel_hotel_id_seq OWNED BY public.hotel.hotel_id;
          public          postgres    false    217            �            1259    25819    pension_type    TABLE     �  CREATE TABLE public.pension_type (
    pension_type_id integer NOT NULL,
    pension_type_hotel_id integer NOT NULL,
    pension_type_ultra boolean NOT NULL,
    pension_type_hsd boolean NOT NULL,
    pension_type_breakfast boolean NOT NULL,
    pension_type_tam boolean NOT NULL,
    pension_type_yarim boolean NOT NULL,
    pension_type_just_bed boolean NOT NULL,
    pension_type_ahfc boolean NOT NULL
);
     DROP TABLE public.pension_type;
       public         heap    postgres    false            �            1259    25818     pension_type_pension_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pension_type_pension_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.pension_type_pension_type_id_seq;
       public          postgres    false    220            B           0    0     pension_type_pension_type_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.pension_type_pension_type_id_seq OWNED BY public.pension_type.pension_type_id;
          public          postgres    false    219            �            1259    25853    reservation    TABLE     �  CREATE TABLE public.reservation (
    reservation_id integer NOT NULL,
    reservation_room_id integer NOT NULL,
    reservation_customer_name character varying(100) NOT NULL,
    reservation_customer_contact character varying(100) NOT NULL,
    reservation_check_in_date date NOT NULL,
    reservation_check_out_date date NOT NULL,
    reservation_total_price numeric(10,2) NOT NULL,
    reservation_guest_count_adult integer NOT NULL,
    reservation_guest_count_child integer NOT NULL,
    reservation_customer_email character varying(50) NOT NULL,
    reservation_customer_tc bigint NOT NULL,
    reservation_customer_note character varying NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false            �            1259    25852    reservation_reservation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reservation_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reservation_reservation_id_seq;
       public          postgres    false    224            C           0    0    reservation_reservation_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.reservation_reservation_id_seq OWNED BY public.reservation.reservation_id;
          public          postgres    false    223            �            1259    25831    room    TABLE     l  CREATE TABLE public.room (
    room_id integer NOT NULL,
    room_hotel_id integer NOT NULL,
    room_type character varying(50) NOT NULL,
    room_price_adult numeric(10,2) NOT NULL,
    room_price_child numeric(10,2) NOT NULL,
    room_stock integer NOT NULL,
    room_bed_count integer NOT NULL,
    room_size integer NOT NULL,
    room_has_tv boolean NOT NULL,
    room_has_minibar boolean NOT NULL,
    room_has_console boolean NOT NULL,
    room_has_safe boolean NOT NULL,
    room_has_projector boolean NOT NULL,
    room_season_type character varying(50) NOT NULL,
    room_pension_type character varying(50)
);
    DROP TABLE public.room;
       public         heap    postgres    false            �            1259    25830    room_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.room_room_id_seq;
       public          postgres    false    222            D           0    0    room_room_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;
          public          postgres    false    221            �            1259    25721    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    user_pass character varying(255) NOT NULL,
    user_role character varying(20) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25720    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    216            E           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    215            �           2604    25801    hotel hotel_id    DEFAULT     p   ALTER TABLE ONLY public.hotel ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotel_hotel_id_seq'::regclass);
 =   ALTER TABLE public.hotel ALTER COLUMN hotel_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    25822    pension_type pension_type_id    DEFAULT     �   ALTER TABLE ONLY public.pension_type ALTER COLUMN pension_type_id SET DEFAULT nextval('public.pension_type_pension_type_id_seq'::regclass);
 K   ALTER TABLE public.pension_type ALTER COLUMN pension_type_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    25856    reservation reservation_id    DEFAULT     �   ALTER TABLE ONLY public.reservation ALTER COLUMN reservation_id SET DEFAULT nextval('public.reservation_reservation_id_seq'::regclass);
 I   ALTER TABLE public.reservation ALTER COLUMN reservation_id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    25834    room room_id    DEFAULT     l   ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);
 ;   ALTER TABLE public.room ALTER COLUMN room_id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    25724    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215    216            :          0    25865    facility 
   TABLE DATA           �   COPY public.facility (facility_id, facility_hotel_id, facility_free_park, facility_free_wifi, facility_pool, facility_gym, facility_concierge, facility_spa, facility_room_service) FROM stdin;
    public          postgres    false    226   >?       2          0    25798    hotel 
   TABLE DATA           �   COPY public.hotel (hotel_id, hotel_name, hotel_address, hotel_city, hotel_region, hotel_email, hotel_phone, hotel_stars, hotel_facility_id, hotel_pension_type_id) FROM stdin;
    public          postgres    false    218   ?A       4          0    25819    pension_type 
   TABLE DATA           �   COPY public.pension_type (pension_type_id, pension_type_hotel_id, pension_type_ultra, pension_type_hsd, pension_type_breakfast, pension_type_tam, pension_type_yarim, pension_type_just_bed, pension_type_ahfc) FROM stdin;
    public          postgres    false    220   \B       8          0    25853    reservation 
   TABLE DATA           a  COPY public.reservation (reservation_id, reservation_room_id, reservation_customer_name, reservation_customer_contact, reservation_check_in_date, reservation_check_out_date, reservation_total_price, reservation_guest_count_adult, reservation_guest_count_child, reservation_customer_email, reservation_customer_tc, reservation_customer_note) FROM stdin;
    public          postgres    false    224   ]D       6          0    25831    room 
   TABLE DATA             COPY public.room (room_id, room_hotel_id, room_type, room_price_adult, room_price_child, room_stock, room_bed_count, room_size, room_has_tv, room_has_minibar, room_has_console, room_has_safe, room_has_projector, room_season_type, room_pension_type) FROM stdin;
    public          postgres    false    222   �E       0          0    25721    users 
   TABLE DATA           I   COPY public.users (user_id, user_name, user_pass, user_role) FROM stdin;
    public          postgres    false    216   �F       F           0    0    facility_facility_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.facility_facility_id_seq', 233, true);
          public          postgres    false    225            G           0    0    hotel_hotel_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotel_hotel_id_seq', 209, true);
          public          postgres    false    217            H           0    0     pension_type_pension_type_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.pension_type_pension_type_id_seq', 169, true);
          public          postgres    false    219            I           0    0    reservation_reservation_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.reservation_reservation_id_seq', 21, true);
          public          postgres    false    223            J           0    0    room_room_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_room_id_seq', 15, true);
          public          postgres    false    221            K           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);
          public          postgres    false    215            �           2606    25869    facility facility_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (facility_id);
 @   ALTER TABLE ONLY public.facility DROP CONSTRAINT facility_pkey;
       public            postgres    false    226            �           2606    25805    hotel hotel_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (hotel_id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_pkey;
       public            postgres    false    218            �           2606    25824    pension_type pension_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.pension_type
    ADD CONSTRAINT pension_type_pkey PRIMARY KEY (pension_type_id);
 H   ALTER TABLE ONLY public.pension_type DROP CONSTRAINT pension_type_pkey;
       public            postgres    false    220            �           2606    25858    reservation reservation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    224            �           2606    25836    room room_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgres    false    222            �           2606    25728    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    25914 "   hotel hotel_hotel_facility_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_hotel_facility_id_fkey FOREIGN KEY (hotel_facility_id) REFERENCES public.facility(facility_id) NOT VALID;
 L   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_hotel_facility_id_fkey;
       public          postgres    false    226    3484    218            �           2606    25919 &   hotel hotel_hotel_pension_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_hotel_pension_type_id_fkey FOREIGN KEY (hotel_pension_type_id) REFERENCES public.pension_type(pension_type_id) NOT VALID;
 P   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_hotel_pension_type_id_fkey;
       public          postgres    false    220    218    3478            �           2606    25837    room room_room_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_hotel_id_fkey FOREIGN KEY (room_hotel_id) REFERENCES public.hotel(hotel_id);
 F   ALTER TABLE ONLY public.room DROP CONSTRAINT room_room_hotel_id_fkey;
       public          postgres    false    218    3476    222            :   �  x�m�A��0��cd˖Ŀ�y_��c2��u҅�R�E6��G<��?KV{����_l[�ܶ�ǳ�ϓ87����y������G�����G�<x�<x��1�c�}4����=K�:r�9+����y����]�F�5��<u��|����,�Z�����Qw4���tT�f8JGr�9����;**�����(o����6)����,�͂���������� �������������C�!�x<���
4��Td`	�9���<p�y�d�����7=��]׶�X9[X�l���0�Z�%�{K�?�d#t�7Y���vB�e�^%؄�;aΥ�������s�r��Lp���rB�a�d��S�T������~��tV�� ����>����< ��>�t�� �%�x�C�!����+��>}��W^�X�~�}Q���I��e���5c�,��L�      2     x�]�AN�0E��S�fQy��$;"��E�@��L�X����\6\�=i����F����E
9yo�`�8����[�!׾�=��x{�d�ž���S��	\�PF��LE�`��8�jgZz�4��@n�VÊ��Wu���?�T(O'br"b(<m��,�"˳��q�͈�=UA�jx�JGv��QK%d,/�	D�6d��Q��.̈�ru~�p���%���=��0��Kiw�7����������X��08
�^1������Az�      4   �  x�m�Q�� C��avb��e�{��6MӖ��d�4���m���v_�b[�,����l�	L�0�Ä�������{,2�2����k!0�T�b�p����z�U�T.2�ؘ�D5�	C�0�:��,�/���4x_�|�����8����}m.Wy��*��1��9-tBA(	uB��t��d�*!򪬧ʊ��UYm#�i����@D;�nhd/z��&����g�;ٻ(o��$�Vvz��>�}����A�A�A�A�A���Oz��>�}�}�}�}�}���}�
��]�y ��y ]�U$|���Q���Q�E�Q�E�Q4E�Q4���s���V��kW�S�%>��Ƀ+�+���E�L��'�`�֜0��Z���)��&�MLRMaTeMMLW.���+��\t���I����5��[�k!"�:B��#��%�BG
�Sh[����l��}#K�5�O���ߺS�ɟ��s~Mj���SJ�<.�      8   `  x���Aj�0E��)t��Hr�]	����E�Q�ز�l���
;�:��(�4-
���3�ؔ���ٖ�6�{&��( ���:?τ� bA%̹��i^�d��e�R;�R!H(����Y���7fܗƙ��M����8� �Bӵ�v1ߖd�䡍�K@�,�`�i��83��\< ��Ԕ����]��@F��*B#5XY��|9�x(��&@�K�!�IL%�g��
_�����>�g�l��R�̖M��B�Y�[��x/[�����U��+22�7����D+�*AR�ֺ|�Ί�h�St�|�^=�g�!�  �b�h���_���:웢�AF�qE�����      6   �   x���M� F��aPh�%Z�h���&&�z��?N�1Vݘ�o5�yc�d��c��wn �����%9T� �XVHà=��Σ��BZ�+�\ڿ�<^'��̟�Qy3䫲��Β��n9��H��`�V9i��s�N�'L,2�}/2|�y�L�n�F��>z��(�|B!�.Y�3��>AQ��$�S	�d�Cr2����#�< �]cH      0   1   x�3�LL����4426�tt����2�,�/�N-����y�q��qqq s
�     