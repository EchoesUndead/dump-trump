function Update-MarkDownIndex {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [String]$FilePath
    )

    Begin {
        [String[]]$FileText = Get-Content -Path $FilePath
        $IndexTable = New-Object Collections.Generic.List[String]
        [String]$Final_Text = ""
    }

    Process {
        foreach ($Line in $FileText) {
            if ($Line.length -gt 2) {
                if ($Line.Substring(0, 3) -eq "###") {
                    Write-Verbose "Found a ### Header"

                    [String]$Date = $Line.Substring(4)

                    Write-Verbose "Extracted Date: $Date"

                    $Split_Date = $Date.Split(" ")

                    Write-Verbose "Split Date Count is $($Split_Date.Count)"

                    [String]$MarkDown_Link = "- [" + $Date + "](" + $Split_Date[0].ToLower() + "-" + $Split_Date[1].Substring(0, 2) + "-" + $Split_Date[2] + ")\n"

                    Write-Verbose "MarkDown Link would be $MarkDown_Link"

                    $IndexTable.Add($MarkDown_Link)
                }
            }
        }

        $Index_Found = $false
        $Index_Removed = $false
        foreach ($Line in $FileText) {
            if ($Index_Removed -eq $false) {

            } else {

            }

            if ($Line.length -gt 2) {
                if ($Line.Substring(0, 3) -eq "###") {
                    Write-Verbose "Found a ### Header"

                    [String]$Date = $Line.Substring(4)

                    Write-Verbose "Extracted Date: $Date"

                    $Split_Date = $Date.Split(" ")

                    Write-Verbose "Split Date Count is $($Split_Date.Count)"

                    [String]$MarkDown_Link = "- [" + $Date + "](" + $Split_Date[0].ToLower() + "-" + $Split_Date[1].Substring(0, 2) + "-" + $Split_Date[2] + ")\n"

                    Write-Verbose "MarkDown Link would be $MarkDown_Link"

                    $IndexTable.Add($MarkDown_Link)
                }
            }
        }
    }

    End {

    }
}