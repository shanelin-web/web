-- Public booking form: visitors may submit, but cannot read or edit requests.
create table public.booking_requests (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null check (char_length(btrim(customer_name)) between 1 and 80),
  phone text not null check (char_length(btrim(phone)) between 6 and 30),
  service_type text not null check (service_type in ('家庭水電', '家庭網路', '其他合作')),
  preferred_date date not null,
  preferred_time text not null check (preferred_time in ('上午', '下午', '晚上', '時間可再討論')),
  area text check (area is null or char_length(btrim(area)) <= 80),
  details text check (details is null or char_length(btrim(details)) <= 1000),
  created_at timestamptz not null default now()
);

alter table public.booking_requests enable row level security;

revoke all on public.booking_requests from public, anon, authenticated;
grant insert (customer_name, phone, service_type, preferred_date, preferred_time, area, details)
  on public.booking_requests to anon;

create policy "Visitors can submit booking requests"
  on public.booking_requests
  for insert
  to anon
  with check (true);
