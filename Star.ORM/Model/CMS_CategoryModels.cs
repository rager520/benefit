/* ==============================
*
* Author: 杨晨
* Time：2015-09-25
* FileName：CMS_CategoryModels.cs
* Version：V1.0.1
* ===============================
*/
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Star.ORM.Model
{
    [Table("CMS_Category")]
    [Serializable]
    public class CMS_CategoryModels
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        /// <summary>
        /// 名称
        /// </summary> 
        public string Name { get; set; }

        /// <summary>
        /// 上级目录
        /// </summary> 
        public int UpperLayer { get; set; }

        /// <summary>
        /// 目录层次
        /// </summary> 
        public int Level { get; set; }

        /// <summary>
        /// 排序
        /// </summary> 
        public int Order { get; set; }

    }
}
