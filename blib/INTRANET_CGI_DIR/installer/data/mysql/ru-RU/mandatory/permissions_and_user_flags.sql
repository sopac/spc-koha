TRUNCATE userflags;

INSERT INTO userflags (bit, flag, flagdesc, defaulton) VALUES
   (0, 'superlibrarian',  'Доступ ко всем библиотечным функциям',0),
   (1, 'circulate',       'Оборот книг',0),
   (2, 'catalogue',       'Просмотр каталога (интерфейс библиотекаря)',0),
   (3, 'parameters',      'Установка системных настроек Koha',0),
   (4, 'borrowers',       'Внесение и изменение посетителей',0),
   (5, 'permissions',     'Установка привилегий пользователя',0),
   (6, 'reserveforothers','Резервирование книжек для посетителей',0),
   (7, 'borrow',          'Заем книг',1),
   (9, 'editcatalogue',   'Изменение каталога (изменение библиографических/локальных данных)',0),
   (10,'updatecharges',   'Обновление оплат пользователей',0),
   (11,'acquisition',     'Управление поступлениями и/или предложениями',0),
   (12,'management',      'Установка параметров управления библиотекой',0),
   (13,'tools',           'Использование инструментов (экспорт, импорт, штрих-коды)',0),
   (14,'editauthorities', 'Разрешение на изменение авторитетных источников',0),
   (15,'serials',         'Разрешение на управление подпиской периодических изданий',0),
   (16,'reports',         'Разрешение на доступ к модулю отчетов',0),
   (17,'staffaccess',     'Смена имени(логина)/привилегий для работников библиотеки',0)
;

TRUNCATE permissions;

INSERT INTO permissions (module_bit, code, description) VALUES
   ( 1, 'circulate_remaining_permissions', 'Remaining circulation permissions'),
   ( 1, 'override_renewals', 'Override blocked renewals'),
   ( 3, 'parameters_remaining_permissions', 'Remaining system parameters permissions'),
   ( 3, 'manage_circ_rules', 'manage circulation rules'),
   ( 6, 'place_holds', 'Place holds for patrons'),
   ( 6, 'modify_holds_priority', 'Modify holds priority'),
   ( 9, 'edit_catalogue', 'Edit catalog (Modify bibliographic/holdings data)'),
   ( 9, 'fast_cataloging', 'Fast cataloging'),
   ( 9, 'edit_items', 'Edit Items'),
   (11, 'vendors_manage', 'Manage vendors'),
   (11, 'contracts_manage', 'Manage contracts'),
   (11, 'period_manage', 'Manage periods'),
   (11, 'budget_manage', 'Manage budgets'),
   (11, 'budget_modify', 'Modify budget (can''t create lines, but can modify existing ones)'),
   (11, 'planning_manage', 'Manage budget plannings'),
   (11, 'order_manage', 'Manage orders & basket'),
   (11, 'group_manage', 'Manage orders & basketgroups'),
   (11, 'order_receive', 'Manage orders & basket'),
   (11, 'budget_add_del', 'Add and delete budgets (but cant modify budgets)'),
   (11, 'budget_manage_all', 'Manage all budgets'),
   (13, 'edit_news',                   'Написание новостей для электронного каталога и интерфейса библиотекарей'),
   (13, 'label_creator',               'Создание печатных наклеек и штрихкодов из каталога и с данными о пользователях'),
   (13, 'edit_calendar',               'Определение дней, когда библиотека закрыта'),
   (13, 'moderate_comments',           'Регулировка комментариев от посетителей'),
   (13, 'edit_notices',                'Определение сообщений'),
   (13, 'edit_notice_status_triggers', 'Установка триггеров сообщений/статусов для просроченных экземпляров'),
   (13, 'edit_quotes',                 'Edit quotes for quote-of-the-day feature'),
   (13, 'view_system_logs',            'Просмотр протоколов системы'),
   (13, 'inventory',                   'Проведение инвентаризации(анализа) Вашего каталога'),
   (13, 'stage_marc_import',           'Заготовка МАРК-записей в хранилище'),
   (13, 'manage_staged_marc',          'Управление заготовленными МАРК-записями, в том числе дополнения и обратный импорт'),
   (13, 'export_catalog',              'Экспортирование библиографической информации и данных о единицах хранения'),
   (13, 'import_patrons',              'Импорт данных о посетителях'),
   (13, 'edit_patrons', 'Perform batch modification of patrons'),
   (13, 'delete_anonymize_patrons',    'Удаление пользователей с протерминованим периодом регистрации и анонимизация истории обращения (изъятие история чтения пользователей)'),
   (13, 'batch_upload_patron_images',  'Загрузка изображений посетителей партиями или всех сразу'),
   (13, 'schedule_tasks',              'Планирование задач к выполнению'),
   (13, 'items_batchmod', 'Perform batch modification of items'),
   (13, 'items_batchdel', 'Perform batch deletion of items'),
   (13, 'manage_csv_profiles',         'Manage CSV export profiles'),
   (13, 'moderate_tags', 'Moderate patron tags'),
   (13, 'rotating_collections', 'Manage rotating collections'),
   (13, 'upload_local_cover_images', 'Upload local cover images'),
   (15, 'check_expiration',            'Check the expiration of a serial'),
   (15, 'claim_serials',               'Claim missing serials'),
   (15, 'create_subscription',         'Create a new subscription'),
   (15, 'delete_subscription',         'Delete an existing subscription'),
   (15, 'edit_subscription',           'Edit an existing subscription'),
   (15, 'receive_serials',             'Serials receiving'),
   (15, 'renew_subscription',          'Renew a subscription'),
   (15, 'routing',                     'Routing'),
   (16, 'execute_reports', 'Execute SQL reports'),
   (16, 'create_reports', 'Create SQL Reports')
;
