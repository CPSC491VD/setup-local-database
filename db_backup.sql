PGDMP                      {            test_database    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16399    test_database    DATABASE     �   CREATE DATABASE test_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE test_database;
                postgres    false            �            1259    16412    crime_date_dimension    TABLE     �   CREATE TABLE public.crime_date_dimension (
    datetime_id integer,
    _month integer,
    _day integer,
    _year integer,
    _hour integer,
    crime_date date
);
 (   DROP TABLE public.crime_date_dimension;
       public         heap    postgres    false            �            1259    16407    crime_fact_table    TABLE     e  CREATE TABLE public.crime_fact_table (
    id character varying,
    datetime_id integer,
    description character varying,
    location_id integer,
    community_area integer,
    iucr character varying,
    case_number character varying,
    domestic boolean,
    fbi_code character varying,
    primary_type character varying(50),
    arrest boolean
);
 $   DROP TABLE public.crime_fact_table;
       public         heap    postgres    false            �            1259    16415    crime_location_dimension    TABLE     �   CREATE TABLE public.crime_location_dimension (
    location_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    location_description character varying,
    block character varying
);
 ,   DROP TABLE public.crime_location_dimension;
       public         heap    postgres    false            �            1259    16441    fbi_code    TABLE     j   CREATE TABLE public.fbi_code (
    index bigint,
    "200" text,
    "Arson" text,
    "Property" text
);
    DROP TABLE public.fbi_code;
       public         heap    postgres    false            �            1259    16447    iucr    TABLE     �   CREATE TABLE public.iucr (
    index bigint,
    "110" text,
    "HOMICIDE" text,
    "FIRST DEGREE MURDER" text,
    "I" text,
    "true" boolean
);
    DROP TABLE public.iucr;
       public         heap    postgres    false            �          0    16412    crime_date_dimension 
   TABLE DATA           c   COPY public.crime_date_dimension (datetime_id, _month, _day, _year, _hour, crime_date) FROM stdin;
    public          postgres    false    216   #       �          0    16407    crime_fact_table 
   TABLE DATA           �   COPY public.crime_fact_table (id, datetime_id, description, location_id, community_area, iucr, case_number, domestic, fbi_code, primary_type, arrest) FROM stdin;
    public          postgres    false    215   @       �          0    16415    crime_location_dimension 
   TABLE DATA           q   COPY public.crime_location_dimension (location_id, latitude, longitude, location_description, block) FROM stdin;
    public          postgres    false    217   ]       �          0    16441    fbi_code 
   TABLE DATA           E   COPY public.fbi_code (index, "200", "Arson", "Property") FROM stdin;
    public          postgres    false    218   z       �          0    16447    iucr 
   TABLE DATA           \   COPY public.iucr (index, "110", "HOMICIDE", "FIRST DEGREE MURDER", "I", "true") FROM stdin;
    public          postgres    false    219   |       `           2606    16421 6   crime_location_dimension crime_location_dimension_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.crime_location_dimension
    ADD CONSTRAINT crime_location_dimension_pkey PRIMARY KEY (location_id);
 `   ALTER TABLE ONLY public.crime_location_dimension DROP CONSTRAINT crime_location_dimension_pkey;
       public            postgres    false    217            a           1259    16446    ix_fbi_code_index    INDEX     G   CREATE INDEX ix_fbi_code_index ON public.fbi_code USING btree (index);
 %   DROP INDEX public.ix_fbi_code_index;
       public            postgres    false    218            b           1259    16452    ix_iucr_index    INDEX     ?   CREATE INDEX ix_iucr_index ON public.iucr USING btree (index);
 !   DROP INDEX public.ix_iucr_index;
       public            postgres    false    219            �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�}UMs�8<�_�Ӝ�5���#�#�T>��M���"�h�%�$'���i;�mv�=PE��=K�_��,�'l��Z�.<e|�(�gK���^<a+����E���N{��Lxi���0���5�[ZS���ހE�v��=�%��z˿��d��Y4쳩)+dC��nO:�X4�9o˴:A0��R�*t&�t97~��uW,N�̖��Q��x��WiT}�V&��5hIM���,r��o̢�>��k��SQ�j_�AD��xc�&J��\H��,M�B(G8-yҎ\���:SL��ȌtJ�F�ԩ�P����Lz>6&�7y��)E�?�t'5�e�)�Q
���|
�F3�Fj#�k!�h���h���%�k�ޠE��qR!&?N�آf�27�?l�tտ�kuR!�Sv|��b�c�glU`ގ����fX�>��P�����ִUr[�{�)Qnwغf�C$��,�7��)�Z�)��˭�e
᎜��x.��ʜz���&ݓ�,d�?9$��ut� O%b�$��V;S(����a�x�^v����<)��N\�3�r�F��Oa�=ǵ1���]�����Q��>,7��LU�_�7����	�/E�LҔ�3V�kkc�&�e����a���)鎇c�f�g�M�wu8��̥�� ��!xZ;�!\������1�'U-�em� KX��xe���|ɐ�X�g�>�x��^76�Ւ<���ܼ����d&?4�5PhN?J��a�ߤ���O�)m�9�;k;-��sK>	�\�ȹC���j�!��\�������>@�H7�ʟ6�:�:1�����HFC��s.��NDƧ;J���! �Z������6 �!�NgۍP3e3�=����3|Z�3��|���܏��wz��*\[�5��*�����1��:����E"���߯q����辰�5�a�-fLEu���P�=�Z|���0���Xr�p�2�3a)�/]ӣ�_�rժ^4%�4Ny���G�����c      �      x��\�r㸒]��������vY|�wGQ��6�|��Y�/���9 I�%�΢���<I � �� }<���pk�"/��Љ����Y\[!�jhϢ=����=��;��gSu���N��]��[��d�Y��G)�Ι~B!��E�!o���������Ⱥ.���]�m�����9��>_�Z�# �{��7�:��Y[Ip����..�yw����u׷C%�^j��)��0�Y}m3tΗ�L-��HPP�����M�-eӃ?0rߋ��;��v��?������B��۴<1��A�����d�8bW�B��ɾ��~��
"���bCF�o��I��0�K抁�7�GIG��6�;RʜvԚ�����[�A�)���|��B2�$?ŭȇ2k�[�W�`nJ̃X4�yv�.�?��тPO<u��+�R�V�5'`���8Ëah?ۅ�N��8���5�?8n �;��D٥����I!x�nG�{� 4�J?1������f��8��O�������û�5۴�_ r+Ah�ro�"Ns���vm�0�%��V1��K�g�K����0�L�%�j�����9� ���սT92� �[l�%�hV�A& Z�0�/��6�ȩ�/�o�?������>�`0�.2X��hʬ/`�)�aj5佚
��-gBsq���S��N~+ʳ����u~���%vr��xʵ���nntK� �J�$�)xB� K�D����X�A2��e����5$�m\����|-h�D�๩D׃0���t,� ��t��"u�OIbl^�tr�%V�Y����J�{=2���Lꇨ"�B-����/�A/c-o�R�uO�a���Y)� ��˪$�00�l�f|A�O�N� y�����F/��Y�B�VB���n�4M��w��/7TOA�y!��?P7��vi������Ȅ���QB��]p��(=�Ȅ����P��@���!�n3�������1��x��JM_�mm�z0D�}�̄!4�?�ݢ ��6��4he�Uٳ]<N �^�Z2"T����q����?���HM�h&��{"���JY ��@1 �GF�'�D���(��I	�R�Ϧ<�ax�)��l����idMB�C��s�+
��åi��T
��{~�"C]f_��4E�C�"c�fӖ���!(��YWhb�N0$���O��?��Q=r�7>�O�w��x�A컉?>��wZ�gE)C-��$�^�:��A�8ctE����p�+}�J��ܧ �;�9�8O�f����ӡPP������B��a��D�ce�i���~ze�ɭN���a�Y҅9�xTto�ѿ݋����d�N�uu�#�$��t��T�i@�8?���|�7E���E+c�Q���D�Ұ���/U��쵀p�C�Tͩ(G���U� ��#B�S��L� �����>�7-�Ňp����bklX�@'���NglrH���i_�9�Y� �g9���L=�|g/��u��>�'zL��!��6PK��<o>U��6�����-zij1���v�XT�b�ѷ��U�CE�B�>m�Pz�v��س:,j�<�s�x�U?J�(ԏ�^7�Sޛ�]����kQ�><�볖}�#ѡ��DU�l�ι�~c�@�@"�݆
�e�f�N��T�heL�����N7�=BB�<B�����g�� �����d7v����rU�E.�=g{o�N��\�`"��tY�*���*t��z�\�\�`����Bf+�&W�����yOp���<Q���͆3*b���<pͪ��)���jh3�KJ��"��HT'��w)�y�p�Z��V�9��=/�{DX-V������I�l5�:�A��Ȼm��ٕu��0�P:Hd�?�!Ӊ9�QzH���#c�M����M���� �"�߲쓛v�eI��*��Wp��~��H��:��Gyo�2���$Tj��3����AB�0q�-ӊ�ː�"�c�zA;�h�D�7��@���L��[�l�"�����S�u|�����
�<f[lZE@V�mT��`�gc����N���9����AmF6]/�̊�d� ���1H���ݜ�9}#�4f}ZMB5VNe	�1�Ýe����r�G����o���x��
Pk�1V߈q���4F-�w����.$��4�V�����F7���=D�Z̗�����b�'$��K�,N-wN#�dSd��P#�5m�ǟxq�g��$�y���U�u~�'��)��A����%ˍ��<v�� F-I�<�.�L��v��[��Q�S��F���bY�ޛV�0�y�iy1��^8�p��X/��'pk.�i�%Ϯ�Fp��Laz�9x׏v K�D�ܙ6���
-K_�։3�����Wv�����џ�v��� �c(�W��R���9�g_��>��$
Csy:��lI)��������yQ�᰻�܎�'��5�6pp# o���x�U8Y����4�VR��	,J��4"�Nc�M&���^X�Ȫ
�qNBb����[|+�E�@ͦ��q�=�Mo1)ڠ*B9c�U�Qe�Gg�RiIH�Ȧe�(G˿�W".6�9{M����X�O��=�悵��Ӏ�כIB*�#Kv��$$|a3�>z���+�e��4�l�P��4��(��4v:�ms+N���e6�*	_<W�.�|�X��D����K9�!+!'�����+"a~�qc���Њ�&7����a~S�;�J.�
�S
FK���|TOL����W�7����w�/�- ���j$��@R�r�R�[�!Z�2>e<��I�H�����i@��u:$�c��
 �����;e )|�ì�̇�Q����S���s���>EMNYе�fp��T����d/zپPaY��<y[bQz��������Ѭo!J'c�hNx�l�����Q�j53�:�>h�3�(��ѵ(Hu
���'g$��b�,�?��n�j�o��o�Z=����@����G�	�,%��;�O�'�1p`S�F$jt?���
m�4��F�����A_�����H��XYxEmv�&�����,͗����f'�͈$	�Z��G�$B���6�;8ytڭ��(�i���A�V��.��,�5d�dgy�UBI$u&tCO%Iz�+�QQ;
���rֈ>ua�n�}�0^�T\�jTB�bs3�W��B����f�T�n��
����߹ S��eb�~���_��4"��d�yG��#��`,��ІMT�5b�p �ʩi>�L�M�;��2�c5)�+�Q^��!Y�l#�o���[V���>A�C]O3O�� ��b
5�F0�cD��a�4��&H٨{'��=k��j�QjY���,��h��i1�b�,6�9�'bZѭ�}�Ƕ4`C�G������i����|�*g:�M����r�P�[�o�aS�e�h�؝�c|S�~� 0��	�_�5�����)�Ƕ	{�<mP06,�И$�3�փfK2��牌l-F�q�\��X5lh��!�QbH~ag0J���ٷc��a��;ʴ�뢂}d	>ٓ��(5�)/�|Koc�\�Z��I]����l�E�g3��tQ�[�����
��=�(,b�g�-JC���5z�Eid���qᱽ���}�'�D��D`Q��?,�͔
����7���[�-쁪1�S�������*sa�-����:������,����������~ݮ^�#S�^ƶ�&^?��6%V�j�D!�@�Ա��7�g�ݞf�����\|t3g�P}��Qa��P�ۧ��֞@i��S��ߠ�q�i16����m�c����TX�/�"�ӗ�e2�%�%��!��	�da*�c�����8��]�J+�2��r�k� ���6o0�nj�!D�uv�������!��؜L�|?�VM�;H�G%�%���*������U�j홪\�(<*�~�H�����_��5kq��zy�{3ȭ㕧:AP��4d�7�L��_a�e;��{�fc�d��YQk�=���2�'7���ӓqN������A�qH?ض�؄�W�sQ��JԈM�}�#M��gi �  `�0؂'q��g��m���i�[�q�'xAϤ��dy�{���#+�!G��
�l����=ש^�b,�B'7(� J^ u�5�CΜ���D��?���ĻM�Z�Ѻ��dJH&�c��IHo'���IIϷ
>�HJ�x�C�ɉ���B���=��4�"�������b�4gW�t��XŬ�M�\/}8��;S��%R�H�߲�W��N�}�+��?3B�b��a��&�D��Bj����δ
2��0@�]��Ȅ�N��m:� ��ÔxBj��#y��(.YQrb��RW�c��Mގmy	)�pBqS�'<����uS���v8�HJ%;C�� y=W�wO�D���*uI�ݑ��d	�ܧT�?�\�I.H�+e�e�HN�&�Ɠ��'�3���/�c�xw����Mj�fl:-�z��\CH�4|Y��q];�n��ީ0�Z��>������ر�~��w��������	&P{Y#Aw���;%�Q�gX�-H_腄-�sc�u�C�������ǶrY�s`�}�G��d�n:�Т�\���籛i�c�����@�?��U=T��k8�N������\	�d� �ǖ��`�?�*�O�k��/IC�����xK��m~� `?�XV@�(������[�i'b_�l��E5�JP��`�	�!1!�C��-<�A!d�L��>6N�_`,����<@�f�����Ηʗ�섺���!9/�x�v@��:-��������,�J4�7{|�^����]���8���tW^�q�.��G����p�o��J гײZ�>��Z��}�wg,׳�oqØ��]Ǉ쌰�ڇ_M����'�݇W͉��y�)_Ǯ�:�翧�{^���}���YT?3����@�S�����S�%�W>�W>�!7_�|v
'a^������k�/Qɻ�XH�B�W���<1�(�z/)��̜<txW3�W�B(�_P4������lQ��3��1ZX/E߮PgD��:Q�ׂw�2p��ŧʐe����TƗ��W/�c*�K�8��E�%O�����6�-���{[�7��\M�/�X�5�yw�_>����M_!�-N�!����+��؛��Qᇠf����<���J,�X�|2�?��E?A��4^i���&�	�2l�R29uV���.�O�n���Hir���)y~�����.U".D�����Q�_�3}2D��N���x����L���γ�8���/lZ?�n<�7����!�7�r����"<5c� _~��I��t�gQ�?s�����
JP_�酱�D	aɣ���I剿��m���E)���Z�w�mkPQ	g~�+s��c�]���6�6��K^��e��=�ޟ�W��F��@b���f�S����7�`
�V���5���Z.�Թ��АP�gP�Z_�:����.լ�;Wj�˄��D8k��,��ON�����jL�ㄿGg�3��bC�����Y���Z����o�y�A��g�pݞV;!ݯ����Dk�S���B�!ٸ������f4�_R3ꦌ��Og|~�~<�h�惖ew���k��tX)i�����x�� �޿+u.�����w[�/�0� ��Wb��#4�����6-W/M	YG��.�Z�v��e�2�܏B��\5�����%F�0"����7�T�c}&��C߱$�,�o�gyQ����$q�$٩�S��]�y9����yp���UJz�����j�AR��M�������~�!��}�!Y1�4P~2��}8Уouz��^����Yp��N��Ë��^�n
��1jAo?	c����qj36�~����u�n���fu��ͣ�h����}1+l^ĩ�2�56��T��-O.|�N�s[����?$rs�fF>ݗ�#�ϦY�v���Ǆ��n���!���,���~�����7|.     