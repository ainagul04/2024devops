####################################
# IAM user and policies for CD
####################################

resource "aws_iam_user" "cd" {
    name = "devops-ud-mark-cd"
  
}

resource "aws_iam_access_key" "cd" {
    user = aws_iam_user.cd.name
  
}

### Policy for terraform backend to S3 and Dynamo DB access ###

data "aws_policy_document" "tf_backend" {
    statement {
        effect = "Allow"
        actions = ["s3:ListBucket"]
        resources = ["arn:aws:s3:::${var.devops-ud-mark-tfstate}"]
    }


    statement {
        effect = "Allow"
        action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
        resources = [
            "arn:aws:s3:::${var.devops-ud-mark-tfstate}/tf-state-deploy/*",
            "arn:aws:s3:::${var.devops-ud-mark-tfstate}/tf-state-deploy-env/*"
        ]
    }

       statement {
        effect = "Allow"
        action = [
            "dynamodb:DescribeTable",
            "dynamodb:GetItem",
            "dynamodb:PutItem",
            "dynamodb:DeleteItem"
        ]
        resources = "arn:aws:dynamodb:*:*:table/${var.devops-ud-mark-lock}"
    }
}

resource "aws_iam_policy" "tf_backend" {
    name = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
    description = "Allow user to use S3 and Dynamo for TF backend resources"
    policy = data.aws_policy_document.tf_backend.json 
}

resource "aws_iam_user_policy_attachment" "tf_backend" {
    user = aws_iam_user.cd.name
    policy_arn = aws_iam_policy.tf_backend.arn
  
}
