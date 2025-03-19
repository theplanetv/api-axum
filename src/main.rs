use slug::slugify;

fn main() {
    let slug = slugify("你好");
    println!("{}", slug);
}
