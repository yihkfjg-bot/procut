-- إنشاء جدول الحلاقين
create table if not exists barbers (
  id text primary key,
  name text not null,
  nameen text,
  whatsapp text not null,
  price integer default 25000,
  photo text
);

-- تفعيل الحماية على مستوى الصفوف
alter table barbers enable row level security;

-- السماح للجميع بالقراءة (عشان الموقع يعرض الحلاقين)
create policy "public read" on barbers
  for select using (true);

-- السماح بالإضافة والتعديل والحذف (تستخدمها لوحة التحكم)
create policy "public insert" on barbers
  for insert with check (true);

create policy "public update" on barbers
  for update using (true);

create policy "public delete" on barbers
  for delete using (true);

-- تعبئة الحلاقين الحاليين (فضل، احمد وضاح، سلوم بدون صور هنا - تضيفهم من لوحة التحكم)
insert into barbers (id, name, nameen, whatsapp, price) values
  ('b1', 'فضل', 'Fadhil', '9647803908050', 25000),
  ('b3', 'احمد وضاح', 'Ahmed Wadhah', '9647717867352', 25000),
  ('b6', 'سلوم', 'Salloum', '9647817557600', 25000),
  ('b2', 'فهد', 'Fahad', '9647765185821', 25000),
  ('b4', 'حسن', 'Hassan', '9647746094409', 25000),
  ('b5', 'منتضر', 'Muntadhar', '9647727773535', 25000)
on conflict (id) do nothing;
