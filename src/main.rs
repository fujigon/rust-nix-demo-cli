use color_eyre::Result;
use curl::easy::Easy;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
struct GitHubRelease {
    tag_name: String,
}

fn main() -> Result<()> {
    let mut buf = Vec::new();
    let mut easy = Easy::new();
    easy.url("https://api.github.com/repos/rust-lang/rust/releases/latest")?;
    easy.follow_location(true)?;
    easy.useragent("curl")?;

    {
        let mut transfer = easy.transfer();
        transfer.write_function(|data| {
            buf.extend_from_slice(data);
            Ok(data.len())
        })?;
        transfer.perform()?;
    }

    let response: GitHubRelease = serde_json::from_slice(&buf)?;

    println!("The latest version of rust is {} now.", response.tag_name);

    Ok(())
}
