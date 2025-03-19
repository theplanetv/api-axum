-- Add migration script here
CREATE TABLE public.blog_tag (
    id UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID (),
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE public.blog_post (
    id UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID (),
    title TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    content TEXT DEFAULT '' NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_draft BOOLEAN DEFAULT TRUE
);

CREATE TABLE public.blog_post_tag (
    id UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID (),
    tag_id UUID,
    post_id UUID,
    CONSTRAINT fk_tag_for_blog_post_tag FOREIGN KEY (tag_id) REFERENCES public.blog_tag (id) ON DELETE CASCADE,
    CONSTRAINT fk_post_for_blog_post_tag FOREIGN KEY (post_id) REFERENCES public.blog_post (id) ON DELETE CASCADE
);
